#include <Arduino.h>
#include <ESP32_Supabase.h>
#include <ArduinoJson.h>
#include <MQ135.h>

#if defined(ESP8266)
#include <ESP8266WiFi.h>
#else
#include <WiFi.h>
#endif
#define PIN_MQ135 A0

Supabase db;
MQ135 mq135_sensor(PIN_MQ135);

// Supabase URL and Anon key
String supabase_url = "https://qxkddqiixegfvuccrfet.supabase.co";
String anon_key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF4a2RkcWlpeGVnZnZ1Y2NyZmV0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTYzMzAwMDgsImV4cCI6MjAxMTkwNjAwOH0.KDKt-sG7X1YiUgOOQD6i8Vbg_2Nfahz2jMbntoBfw9M";

// Supabase retrive table data
String table_name = "living_room_2";  // Table name
const int read_limit = 3;           // Read data limit each time

// WiFi credentials (SSID and Password)
//const char *ssid =  "iPhone 12 Pro";  
//const char *pass =  "kangyichen";
const char *ssid =  "jc&yc home";  
const char *pass =  "09021128";

// Supabase auto update info
unsigned long previousMillis = 0;
int update_duration = 500;           // milliseconds

// Assume
float temperature = 20; // Assume current temperature. Recommended to measure with DHT22
float humidity = 50; // Assume current humidity. Recommended to measure with DHT22

float ppm = 0;

// ————————————————————————————————————————————————————————————————————————————

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

// ————————————————————————————————————————————————————————————————————————————

void mqReadData(){
  float rzero = mq135_sensor.getRZero();
  float correctedRZero = mq135_sensor.getCorrectedRZero(temperature, humidity);
  float resistance = mq135_sensor.getResistance();
  ppm = mq135_sensor.getPPM();
  float correctedPPM = mq135_sensor.getCorrectedPPM(temperature, humidity);
  Serial.println(ppm);
}

void updateDataFromSupabase(){
  // Create JSON
  String output = "";
  StaticJsonDocument<192> doc;

  JsonObject doc_0 = doc.createNestedObject();
  doc_0["name"] = "Air Quality";
  doc_0["data1"] = ppm;
  doc_0["id"] = 1;
  doc_0["is_therm"] = false;
  doc_0["is_humid"] = false;
  doc_0["is_air"] = true;

  serializeJson(doc, output);

  // Update Supabase column data
  int code = db.update(table_name).eq("id", "1").doUpdate(output);
  //Serial.println(code);

  db.urlQuery_reset();
}

// ————————————————————————————————————————————————————————————————————————————

void setup() {
  Serial.begin(115200);
  connectToWiFi();                    // Init ESP8266 WiFi Connection
  setupSupabase();                    // Init Supabase Connection
}

void loop() {
  unsigned long currentMillis = millis();             // Setup delay without delay() update
  if(currentMillis-previousMillis > update_duration)  // Update every interval  
    { 
      previousMillis = currentMillis;                 // Reset counter
      mqReadData();                         // Read data from Supabase
      updateDataFromSupabase();                       // Update data from Supabase
    }
}