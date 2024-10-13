#include <ArduinoJson.h>

//char input[] = "[{"name":"Ceiling Fan 1","state":false,"id":1,"is_light":false,"is_fan":true,"is_shades":false}, {"name":"Ceiling Fan 2","state":false,"id":2,"is_light":false,"is_fan":true,"is_shades":false}, {"name":"Light 1","state":false,"id":3,"is_light":true,"is_fan":false,"is_shades":false}, {"name":"Light 2","state":false,"id":4,"is_light":true,"is_fan":false,"is_shades":false}, {"name":"Living Room Shades","state":false,"id":5,"is_light":false,"is_fan":false,"is_shades":true}, {"name":"Bedroom Shades","state":false,"id":6,"is_light":false,"is_fan":false,"is_shades":true}]";
  char input[] = "[{\"name\":\"Ceiling Fan 1\",\"state\":false,\"id\":1,\"is_light\":false,\"is_fan\":true,\"is_shades\":false}, {\"name\":\"Ceiling Fan 2\",\"state\":false,\"id\":2,\"is_light\":false,\"is_fan\":true,\"is_shades\":false}, {\"name\":\"Light 1\",\"state\":false,\"id\":3,\"is_light\":true,\"is_fan\":false,\"is_shades\":false}, {\"name\":\"Light 2\",\"state\":false,\"id\":4,\"is_light\":true,\"is_fan\":false,\"is_shades\":false}, {\"name\":\"Living Room Shades\",\"state\":false,\"id\":5,\"is_light\":false,\"is_fan\":false,\"is_shades\":true}, {\"name\":\"Bedroom Shades\",\"state\":false,\"id\":6,\"is_light\":false,\"is_fan\":false,\"is_shades\":true}]";


void setup() {
  Serial.begin(115200);
  delay(1000);
  
  // char input[MAX_INPUT_LENGTH];
/*
  StaticJsonDocument<768> doc;
  DeserializationError error = deserializeJson(doc, input);

  if (error) {
    Serial.print(F("deserializeJson() failed: "));
    Serial.println(error.f_str());
    return;
  }

  for (JsonObject item : doc.as<JsonArray>()) {
    const char* name = item["name"]; // "Ceiling Fan 1", "Ceiling Fan 2", "Light 1", "Light 2", "Living Room ...
    bool state = item["state"]; // false, false, false, false, false, false
    int id = item["id"]; // 1, 2, 3, 4, 5, 6
    bool is_light = item["is_light"]; // false, false, true, true, false, false
    bool is_fan = item["is_fan"]; // true, true, false, false, false, false
    bool is_shades = item["is_shades"]; // false, false, false, false, true, true

    Serial.print("Name: ");
    Serial.println(name);
    Serial.print("State: ");
    Serial.println(state);
  }
  */
  DynamicJsonDocument doc(2048);
  deserializeJson(doc, input);

  for (JsonObject item : doc.as<JsonArray>()) {
    const char* name = item["name"]; // "Ceiling Fan 1", "Ceiling Fan 2", "Light 1", "Light 2", "Living Room ...
    bool state = item["state"]; // false, false, false, false, false, false

    Serial.print("Name: ");
    Serial.println(name);
    Serial.print("State: ");
    Serial.println(state);
  }
}

void loop() {
  // Nothing to do in the loop for this test program
}

void serialEvent() {
  // Handle serial events, if needed
}
