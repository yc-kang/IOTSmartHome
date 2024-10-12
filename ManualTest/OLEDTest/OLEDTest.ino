#include <Arduino.h>
#include <U8g2lib.h>
#include <MQ135.h>
#include "DHT.h"

#ifdef U8X8_HAVE_HW_SPI
#include <SPI.h>
#endif
#ifdef U8X8_HAVE_HW_I2C
#include <Wire.h>
#endif

#define PIN_MQ135 A0 // MQ135 Analog Input Pin
#define DHTPIN 2 // DHT Digital Input Pin
#define DHTTYPE DHT22 // DHT11 or DHT22, depends on your sensor

U8G2_SSD1306_128X64_NONAME_1_SW_I2C u8g2(U8G2_R0, /* clock=*/ SCL, /* data=*/ SDA, /* reset=*/ U8X8_PIN_NONE);   // All Boards without Reset of the Display
MQ135 mq135_sensor(PIN_MQ135);
DHT dht(DHTPIN, DHTTYPE);

float temperature, humidity; // Temp and Humid floats, will be measured by the DHT
float correctedPPM;

const int limit = 5;
String name[limit]={"Door 1","Door 2","Air 1","Light 1","Light 2"};
int data[limit]={1,0,1,0,1};

void setup(void) {
  u8g2.begin();
  dht.begin();
  Serial.begin(115200);
}
/*
void loop(void) {
  u8g2.setFont(u8g2_font_bpixel_tr);
  u8g2.firstPage();
  do {
    u8g2.setCursor(5, 15);
    u8g2.print(F("Ceiling Fan 1: ON"));
    u8g2.setCursor(5, 30);
    u8g2.print(F("Ceiling Fan 2: OFF"));
    u8g2.setCursor(5, 45);
    u8g2.print(F("Light 1: ON"));
    u8g2.setCursor(5, 60);
    u8g2.print(F("Light 2: OFF"));
  } while ( u8g2.nextPage() );
  delay(2000);
  u8g2.firstPage();
  do {
    u8g2.setCursor(5, 15);
    u8g2.print(F("Door: OFF"));
    u8g2.setCursor(5, 30);
  } while ( u8g2.nextPage() );
  delay(2000);
}*/

void loop(){
  humidity = dht.readHumidity();
  temperature = dht.readTemperature();
  correctedPPM = mq135_sensor.getPPM();

  Serial.println(humidity);
  Serial.println(temperature);
  Serial.println(correctedPPM);
  Serial.println();

  u8g2.setFont(u8g2_font_bpixel_tr);
  u8g2.firstPage();
  do {
      u8g2.setCursor(5, 7);
      u8g2.print("Humidity = "+String(humidity));
      u8g2.setCursor(5, 21);
      u8g2.print("Temperature = "+String(temperature));
      u8g2.setCursor(5, 35);
      u8g2.print("Air Quality = "+String(correctedPPM));
  } while (u8g2.nextPage());
  delay(500);
}

