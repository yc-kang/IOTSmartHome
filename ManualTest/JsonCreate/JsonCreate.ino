#include <ArduinoJson.h>

String output = "";

void setup() {
  Serial.begin(115200);
}

void loop() {
  const int capacity = JSON_OBJECT_SIZE(6);
  StaticJsonDocument<capacity> doc;
  doc["name"] = "Ceiling Fan 1";
  doc["state"] = 0;
  doc["id"] = 1;
  doc["is_light"] = 0;
  doc["is_fan"] = 1;
  doc["is_shades"] = 0;

  serializeJson(doc, output);

  Serial.println(output);
  Serial.println();
  delay(1000);
}

void serialEvent() {
  // Handle serial events, if needed
}
