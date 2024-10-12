/*
Program: Supabase GPIO Control
Version: v5.0 (Stable Version)
Supported Features:
- JSON serialize/deserialize (Read/Write from Supabase)
- Obtain internet time (NTP Server)
- Send IR Signal (Air Cond Control)
- OLED Display (Input, Output, Data/Time)
- Shift Registers Control (for LED, Motor, Door)
- Inputs sensor uploads new data

Working On:
- Improve Stability, encounter some delays
- Sometimes DHT22 not working (Wiring Issue, not software side)
______________________________________________________________

Pin Mapping:
1. Inputs:
MQ135 - A0 (Analog)
DHT11 - D4|2

2. Outputs:
SCL - D1|5
SDA - D2|4
Latch - D5|14
Clock - D6|12
Data - D7|13
IR - D8|15

3. Shift Register:
Q0 - Door 
Q1 - LED1
Q2 - LED2
Q3 - LED3 (Not Used)
Q4 - LED4 (Not Used)
Q5 - LED_WiFi
Q6 - Motor1
Q7 - Motor2

Note: Input uses 3.3V as VCC, Output uses 5V as VCC
*/

#include <Arduino.h>
#include <ESP32_Supabase.h>
#include <ArduinoJson.h>
#include <U8g2lib.h>
#include <NTPClient.h>
#include <WiFiUdp.h>
#include "PinDefinitionsAndMore.h" // Define IR pinouts,macro,etc
#include <IRremote.hpp>
#include <MQ135.h>
#include "DHT.h"
//#include <Adafruit_Sensor.h>

// ESP8266WiFi Init()
#if defined(ESP8266)
#include <ESP8266WiFi.h>
#else
#include <WiFi.h>
#endif

// U8g2 Init()
#ifdef U8X8_HAVE_HW_SPI
#include <SPI.h>
#endif
#ifdef U8X8_HAVE_HW_I2C
#include <Wire.h>
#endif

// select only NEC and the universal decoder for pulse distance protocols
#define DECODE_NEC          // Includes Apple and Onkyo
#define DECODE_DISTANCE_WIDTH // In case NEC is not received correctly. Universal decoder for pulse distance width protocols

// Pins Definition
#define MQ_PIN    A0    // MQ135 (Air Quality Sensor)
#define DHT_PIN   2     // DHT22 (Temp Humid Sensor)
#define SCL_PIN   5     // SCL (OLED)
#define SDA_PIN   4     // SDA (OLED)
#define LATCH_PIN 14    // Latch (74HC595)
#define CLK_PIN   12    // Clock (74HC595)
#define DATA_PIN  13    // Data (74HC595)
#define IR_PIN    15    // IR Sender

#define DHT_TYPE DHT22 // DHT11 or DHT22, depends on your sensor

//____________________________________________________________________

// Library Init()
Supabase db;
U8G2_SSD1306_128X64_NONAME_1_SW_I2C u8g2(U8G2_R0, /* clock=*/ SCL, /* data=*/ SDA, /* reset=*/ U8X8_PIN_NONE);
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "pool.ntp.org");
MQ135 mq135_sensor(MQ_PIN);
DHT dht(DHT_PIN, DHT_TYPE);

// Supabase URL and Anon key
String supabase_url = "https://qxkddqiixegfvuccrfet.supabase.co";
String anon_key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF4a2RkcWlpeGVnZnZ1Y2NyZmV0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTYzMzAwMDgsImV4cCI6MjAxMTkwNjAwOH0.KDKt-sG7X1YiUgOOQD6i8Vbg_2Nfahz2jMbntoBfw9M";

// Supabase retrive table data
String table_name = "living_room";  // Table name
const int read_limit = 5;           // Read data limit each time
String table_name_2 = "ir";
const int read_limit_2 = 8;

// Supabase update sensor data
String table_name_4 = "sensor_data";
String table_name_5 = "sensor_id";
String current_time;
int current_id=1;
int current_id_2=51;
int current_id_3=101;

// WiFi credentials (SSID and Password)
//const char *ssid =  "iPhone 12 Pro";  
//const char *pass =  "kangyichen";
const char *ssid =  "jc&yc home";  
const char *pass =  "09021128";

// Supabase auto update info
unsigned long previousMillis = 0;
unsigned long previousMillis_1 = 0;
unsigned long previousMillis_2 = 0;
int update_duration = 250;           // Supabase update interval, in ms
int update_duration_1 = 3000;        // OLED update interval, in ms
int update_duration_2 = 3000;        // Sensor update interval, in ms

int oledState = 0;

// Variables
String nameUpdate[read_limit+1];    // String array to store names
bool stateUpdate[read_limit+1];     // Integer array to store states
String nameUpdate_2[read_limit_2];    // String array to store names (IR)
int stateUpdate_2[read_limit_2];      // Integer array to store states (IR)
int previousState[read_limit_2];      // Integer array of IR prev state

void connectToWiFi(){                 // Connecting ESP8266 to Wi-Fi
  Serial.print("Connecting to WiFi");
  WiFi.begin(ssid, pass);
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(100);
    Serial.print(".");
  }
  Serial.println("Connected!");

  // Lights up LED_WIFI
  digitalWrite(LATCH_PIN, LOW);
  shiftOut(DATA_PIN, CLK_PIN, LSBFIRST, B00000100);
	digitalWrite(LATCH_PIN, HIGH);

  nameUpdate[5] = "WiFi LED";
  stateUpdate[5] = 1;
}

void setupSupabase() {
  db.begin(supabase_url, anon_key);   // Beginning Supabase Connection
  Serial.println("Supabase init done!");
}

void initGPIO(){
  // Init Sensors
  pinMode(MQ_PIN, INPUT);
  pinMode(DHT_PIN, INPUT);
  
  // Init Shift Register 
  pinMode(LATCH_PIN, OUTPUT);
  pinMode(CLK_PIN, OUTPUT);
  pinMode(DATA_PIN, OUTPUT);

  // Init IR
  pinMode(IR_PIN, OUTPUT);
  digitalWrite(LATCH_PIN, LOW);
}

void retrieveSupabaseID(){
  //Retrieve JSON data from supabase
  String read = db.from(table_name_5).select("*").lt("verify", "5").order("verify", "asc", true).limit(3).doSelect();

  StaticJsonDocument<192> doc;
  deserializeJson(doc, read);

  int i=0;
  int id[3];
  for (JsonObject item : doc.as<JsonArray>()) {
    int temp = item["id"];
    id[i]=temp;
    i++;
  }
  current_id=id[0]; current_id_2=id[1]; current_id_3=id[2];

  // Out of Range Check
  if(current_id<1 || current_id>20) current_id=1;
  if(current_id_2<51 || current_id_2>70) current_id_2=51;
  if(current_id_3<101 || current_id_3>120) current_id_3=101;

  Serial.println("ID1: "+String(current_id));
  Serial.println("ID2: "+String(current_id_2));
  Serial.println("ID3: "+String(current_id_3));
  Serial.println();
  db.urlQuery_reset();
}

//____________________________________________________________________________

// IR Remote
void readDataFromSupabase_2(){
  // Read data from supabase
  String read = db.from(table_name_2).select("*").lt("id", "10").order("id", "asc", true).limit(read_limit_2).doSelect();

  // Extract data from the JSON document
  DynamicJsonDocument doc(2048);
  deserializeJson(doc, read);

  int i=0;
  for (JsonObject item : doc.as<JsonArray>()) {
    const char* name = item["name"]; // Eg: "temp_up", "temp_down", "mode", ...
    bool data = item["data"]; // Eg: false, false, false, false, false, false
    nameUpdate_2[i] = name;
    stateUpdate_2[i] = data;
    i++;
  }
  db.urlQuery_reset();

  for (int i = 0; i < read_limit_2; i++) {
    Serial.print("Name: ");
    Serial.print(nameUpdate_2[i]);
    Serial.print(", State: ");
    Serial.println(stateUpdate_2[i]);
  }
  Serial.println();  
}

// Check if remote control button is pressed, if YES trigger IR Sender
void detectChanges(){
  for(int i=0;i<read_limit_2;i++){
    if (stateUpdate_2[i] != previousState[i]){
      irSender(i);
      previousState[i] = stateUpdate_2[i];
    }
  }
}

void irSender(int index){
  switch(index){
    case 0: IrSender.sendNEC(0xFF00, 69, 2);  // On/Off
            break;
    case 1: IrSender.sendNEC(0xFF00, 24, 2);  // Temp up
            break;
    case 2: IrSender.sendNEC(0xFF00, 82, 2);  // Temp down
            break;
    case 3: IrSender.sendNEC(0xFF00, 8, 2);   // Mode
            break;
    case 4: IrSender.sendNEC(0xFF00, 90, 2);  // Fan
            break;
    case 5: IrSender.sendNEC(0xFF00, 22, 2);  // Hot
            break;
    case 6: IrSender.sendNEC(0xFF00, 13, 2);  // Cold
            break;
    case 7: IrSender.sendNEC(0xFF00, 25, 2);  // Timer
            break;
    default: Serial.println("Index not in range (only 0~7)");
             break;
  }
}

// GPIO Control
void readDataFromSupabase_3(){
  // Read data from supabase
  String read1 = db.from(table_name).select("*").lt("id", "10").order("id", "asc", true).limit(read_limit).doSelect();
  db.urlQuery_reset();  

  // Extract data from the JSON document
  DynamicJsonDocument doc1(2048);
  deserializeJson(doc1, read1);

  // The rest GPIOs
  int i=0;
  for (JsonObject item : doc1.as<JsonArray>()) {
    String name = item["name"];
    bool state = item["state"];      // Eg: false, false, false, false, false, false
    nameUpdate[i] = name;
    stateUpdate[i] = state;
    i++;
  }

  for(int i=0; i < read_limit+1; i++) {
    Serial.print("Name: ");
    Serial.print(nameUpdate[i]);
    Serial.print(", State: ");
    Serial.println(stateUpdate[i]);
  }
  Serial.println();  
}

// Construct an 8-bit integer by bitwise OR operations
uint8_t constructHexFromBool(bool a0, bool a1, bool a2, bool a3, bool a4, bool a5, bool a6, bool a7) {
    uint8_t result = 0;

    result = (a0 ? 1 : 0) | 
             ((a1 ? 1 : 0) << 1) | 
             ((a2 ? 1 : 0) << 2) | 
             ((a3 ? 1 : 0) << 3) | 
             ((a4 ? 1 : 0) << 4) | 
             ((a5 ? 1 : 0) << 5) | 
             ((a6 ? 1 : 0) << 6) | 
             ((a7 ? 1 : 0) << 7);

    return result;
}

String genString(int input) {
    if (input == 0) {
        return "OFF";
    } else if (input == 1) {
        return "ON";
    } else {
        return "Invalid input"; // Or handle other cases as needed
    }
}

void oledControl(int oledState){
  u8g2.setFont(u8g2_font_bpixel_tr);
  if(oledState==0){
    u8g2.firstPage();
    do {
      u8g2.setCursor(5, 7); // 64 Lines: 7,21,35,49,62
      u8g2.print("Door: "+genString(stateUpdate[0]));
      u8g2.setCursor(5, 21);
      u8g2.print("Light 1: "+genString(stateUpdate[1]));
      u8g2.setCursor(5, 35);
      u8g2.print("Light 2: "+genString(stateUpdate[2]));
      u8g2.setCursor(5, 49);
      u8g2.print("Fan 1: "+genString(stateUpdate[3]));
      u8g2.setCursor(5, 62);
      u8g2.print("Fan 2: "+genString(stateUpdate[4]));
    } while ( u8g2.nextPage() );
  }
  else if(oledState==1){
    u8g2.firstPage();
    do {
      timeClient.update();
      time_t epochTime = timeClient.getEpochTime();
      struct tm *ptm = gmtime ((time_t *)&epochTime);

      String minutes;
      int currentMinutes = timeClient.getMinutes();
      if(currentMinutes<10) minutes="0"+String(currentMinutes);
      else minutes=String(currentMinutes);
      int currentHours = timeClient.getHours();
      String dayState = "AM";
      if(currentHours>11) dayState = "PM";
      if(currentHours>12) currentHours = currentHours-12;

      String currentTime = String(currentHours) + ":" + minutes + " " + dayState;
      String currentDate = String(ptm->tm_year+1900) + "-" + String(ptm->tm_mon+1) + "-" + String(ptm->tm_mday);
      u8g2.setCursor(5, 7);
      u8g2.print("Time: " + currentTime);
      u8g2.setCursor(5, 21);
      u8g2.print("Date: " + currentDate);

      float ppm = mq135_sensor.getPPM();
      float humidity = dht.readHumidity();
      float temperature = dht.readTemperature();
      Serial.println("Temp: "+String(temperature));
      Serial.println("Humid "+String(humidity));

      // If sensors not working
      if(!(temperature>15 && temperature<40)) temperature=24;
      if(!(humidity>0 && humidity<100)) humidity=65;
      if(!(ppm>6000 && ppm<2000)) ppm=3250;

      u8g2.setCursor(5, 35);
      u8g2.print("Air: " + String(ppm) + " ppm");
      u8g2.setCursor(5, 49);
      u8g2.print("Humid: " + String(humidity) + " %");
      u8g2.setCursor(5, 62);
      u8g2.print("Temp: " + String(temperature) + " C");
      } while ( u8g2.nextPage() );
  }
}

void ShiftRegisterControl(){
  uint8_t hexResult = constructHexFromBool(stateUpdate[0],stateUpdate[1],stateUpdate[2],0,0,stateUpdate[5],stateUpdate[3],stateUpdate[4]);
  digitalWrite(LATCH_PIN, LOW);
  shiftOut(DATA_PIN, CLK_PIN, MSBFIRST, hexResult);
	digitalWrite(LATCH_PIN, HIGH);
}

//________________________________________________________________________

void WriteDataSupabase(){
  // Sensor Reading from DHT11 & MQ135
  int temperature = dht.readTemperature();
  int humidity = dht.readHumidity();
  int ppm = mq135_sensor.getPPM();
  if(!(temperature>15 && temperature<40)) temperature=24;
  if(!(humidity>0 && humidity<100)) humidity=65;
  if(!(ppm>6000 && ppm<2000)) ppm=3250;

  // Obtain New Timestamp
  timeClient.update();
  time_t epochTime = timeClient.getEpochTime();
  struct tm *ptm = gmtime ((time_t *)&epochTime);

  int currentMinutes = timeClient.getMinutes();
  int currentHours = timeClient.getHours();
  int currentTime = currentHours*100+currentMinutes;

  Serial.println("Time: "+String(currentTime));
  Serial.println();

  // Table Format: id(int8), data(int8), time(int8)
  // Temperature
  String JSON="";
  StaticJsonDocument<100> doc;
  JsonObject doc_0 = doc.createNestedObject();
  doc_0["id"] = current_id;
  doc_0["data"] = temperature;
  doc_0["time"] = currentTime;
  serializeJson(doc, JSON);
  int code = db.update(table_name_4).eq("id",String(current_id)).doUpdate(JSON);
  db.urlQuery_reset();

  // Humidity
  String JSON1="";
  StaticJsonDocument<100> doc1;
  JsonObject doc_1 = doc1.createNestedObject();
  doc_1["id"] = current_id_2;
  doc_1["data"] = humidity;
  doc_1["time"] = currentTime;
  serializeJson(doc1, JSON1);
  int code1 = db.update(table_name_4).eq("id",String(current_id_2)).doUpdate(JSON1);
  db.urlQuery_reset();

  // Air Quality
  String JSON2="";
  StaticJsonDocument<100> doc2;
  JsonObject doc_2 = doc2.createNestedObject();
  doc_2["id"] = current_id_3;
  doc_2["data"] = ppm;
  doc_2["time"] = currentTime;
  serializeJson(doc2, JSON2);
  int code2 = db.update(table_name_4).eq("id",String(current_id_3)).doUpdate(JSON2);
  db.urlQuery_reset();
}

void UpdateSupabaseID(){
  // Table Format: id (int8), verify(text)
  // Temperature Data Update
  if(current_id<20) current_id++;
  else current_id=1;
  String JSON="";
  StaticJsonDocument<100> doc;
  JsonObject doc_0 = doc.createNestedObject();
  doc_0["id"] = String(current_id);
  doc_0["verify"] = "1";
  serializeJson(doc, JSON);
  int code = db.update(table_name_5).eq("verify","1").doUpdate(JSON);
  db.urlQuery_reset();

  // Humidity Data Update
  if(current_id_2<70) current_id_2++;
  else current_id_2=51;
  String JSON1="";  
  StaticJsonDocument<100> doc1;
  JsonObject doc_1 = doc1.createNestedObject();
  doc_1["id"] = String(current_id_2);
  doc_1["verify"] = "2";
  serializeJson(doc1, JSON1);
  int code1 = db.update(table_name_5).eq("verify","2").doUpdate(JSON1);
  db.urlQuery_reset();

  // MQ135 Data Update
  if(current_id_3<120) current_id_3++;
  else current_id_3=101;
  String JSON2="";  
  StaticJsonDocument<100> doc2;
  JsonObject doc_2 = doc2.createNestedObject();
  doc_2["id"] = String(current_id_3);
  doc_2["verify"] = "3";
  serializeJson(doc2, JSON2);
  int code2 = db.update(table_name_5).eq("verify","3").doUpdate(JSON2);
  db.urlQuery_reset();
}

//________________________________________________________________________

void setup() {
  Serial.begin(115200);             // Init Serial Monitor
  initGPIO();                       // Init GPIO (PinMode,State,etc)

  connectToWiFi();                  // Init ESP8266 WiFi Connection
  setupSupabase();                  // Init Supabase Connection
  retrieveSupabaseID();             // Obtain Supabase Sensor ID            
  timeClient.begin();
  timeClient.setTimeOffset(28800);  // GMT +8 = 28800
  u8g2.begin();                     // Init OLED Display
  dht.begin();                      // Init DHT Sensor
  IrSender.begin();                 // Init IR Transmitter
}

void loop() {
  unsigned long currentMillis = millis();             // Setup delay without delay() update
  if(currentMillis-previousMillis > update_duration){ 
    previousMillis = currentMillis;     // Reset counter
    readDataFromSupabase_2();           // Supabase: Read IR Remote
    readDataFromSupabase_3();           // Supabase: GPIO Control
    detectChanges();                    // IR Remote check
    ShiftRegisterControl();             // Update 74HC595
  }

  if(currentMillis-previousMillis_1 > update_duration_1){
    previousMillis_1 = currentMillis;
    if (oledState == 0) {
      oledState = 1;
    } else {
      oledState = 0;
    }
    oledControl(oledState);           // Update OLED Display
  }
/*
  if(currentMillis-previousMillis_2 > update_duration_2){
    previousMillis_2 = currentMillis;
    WriteDataSupabase();
    UpdateSupabaseID();
    Serial.println("Data Updated!");
  }*/
}
