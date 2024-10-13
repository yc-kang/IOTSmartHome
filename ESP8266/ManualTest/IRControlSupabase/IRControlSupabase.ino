#include <Arduino.h>
#include "PinDefinitionsAndMore.h" // Define macros for input and output pin etc.
#include <IRremote.hpp>
#include <ESP32_Supabase.h>
#include <ArduinoJson.h>

// ESPWiFi Init
#if defined(ESP8266)
#include <ESP8266WiFi.h>
#else
#include <WiFi.h>
#endif

// select only NEC and the universal decoder for pulse distance protocols
#define DECODE_NEC          // Includes Apple and Onkyo
#define DECODE_DISTANCE_WIDTH // In case NEC is not received correctly. Universal decoder for pulse distance width protocols

Supabase db;

// Supabase URL and Anon key
String supabase_url = "https://qxkddqiixegfvuccrfet.supabase.co";
String anon_key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF4a2RkcWlpeGVnZnZ1Y2NyZmV0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTYzMzAwMDgsImV4cCI6MjAxMTkwNjAwOH0.KDKt-sG7X1YiUgOOQD6i8Vbg_2Nfahz2jMbntoBfw9M";

// Supabase retrive table data
String table_name_2 = "ir";
const int read_limit_2 = 8;

// WiFi credentials (SSID and Password)
//const char *ssid =  "iPhone 12 Pro";  
//const char *pass =  "kangyichen";
const char *ssid =  "jc&yc home";  
const char *pass =  "09021128";

// Supabase auto update info
unsigned long previousMillis = 0;
int update_duration = 250;           // Supabase update interval, in ms

// Variables
String nameUpdate_2[read_limit_2];        // String array to store names (IR)
int stateUpdate_2[read_limit_2];         // Integer array to store states (IR)
int previousState[read_limit_2];

void connectToWiFi(){                 // Connecting ESP8266 to Wi-Fi
  Serial.print("Connecting to WiFi");
  WiFi.begin(ssid, pass);
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(100);
    Serial.print(".");
  }
  Serial.println("Connected!");
}

void setupSupabase() {
  db.begin(supabase_url, anon_key);   // Beginning Supabase Connection
  Serial.println("Supabase init done!");
}

void readDataFromSupabase_2(){
  // Read data from supabase
  String read = db.from(table_name_2).select("*").lt("id", "10").order("id", "asc", true).limit(read_limit_2).doSelect();

  // Extract data from the JSON document
  DynamicJsonDocument doc(2048);
  deserializeJson(doc, read);

  int i=0;
  for (JsonObject item : doc.as<JsonArray>()) {
    const char* name = item["name"]; // "Ceiling Fan 1", "Ceiling Fan 2", "Light 1", "Light 2", "Living Room ...
    bool data = item["data"]; // false, false, false, false, false, false
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
    default:  Serial.println("Error");
              break;
  }
}

void setup() {
  Serial.begin(115200);
  connectToWiFi();                  // Init ESP8266 WiFi Connection
  setupSupabase();                  // Init Supabase Connection
  IrSender.begin();
}

void loop() {
  unsigned long currentMillis = millis();               // Setup delay without delay() update
  if(currentMillis-previousMillis > update_duration){ 
    previousMillis = currentMillis;                     // Reset counter                      
    readDataFromSupabase_2();
    detectChanges();  
  }

  /*
  IrSender.sendNEC(0xFF00, 69, 2);  // On/Off
  IrSender.sendNEC(0xFF00, 24, 2);  // Temp up
  IrSender.sendNEC(0xFF00, 82, 2);  // Temp down
  IrSender.sendNEC(0xFF00, 8, 2);   // Mode
  IrSender.sendNEC(0xFF00, 90, 2);  // Fan
  IrSender.sendNEC(0xFF00, 22, 2);  // Hot
  IrSender.sendNEC(0xFF00, 13, 2);  // Cold
  IrSender.sendNEC(0xFF00, 25, 2);  // Timer
  IrReceiver.restartAfterSend();
  delay(1000);
  */
}
