#include <IRremote.h>
#include <U8g2lib.h>
#include <EEPROM.h>

#ifdef U8X8_HAVE_HW_SPI
#include <SPI.h>
#endif
#ifdef U8X8_HAVE_HW_I2C
#include <Wire.h>
#endif

#define IR_RECEIVE_PIN 13

U8G2_SSD1306_128X64_NONAME_1_SW_I2C u8g2(U8G2_R0, /* clock=*/ SCL, /* data=*/ SDA, /* reset=*/ U8X8_PIN_NONE);   // All Boards without Reset of the Display

// EEPROM Init
void writeIntIntoEEPROM(int address, int number)
{ 
  EEPROM.write(address, number >> 8);
  EEPROM.write(address + 1, number & 0xFF);
}

int readIntFromEEPROM(int address)
{
  return (EEPROM.read(address) << 8) + EEPROM.read(address + 1);
}

// OLED Display Variables
String name[5]={"Temp","Fan","State","Mode","Timer"};
String data[5];

// Millis
unsigned long previousMillis = 0;
unsigned long previousMillis1 = 0;
unsigned long previousMillis2 = 0;
int update_duration = 300;
int update_duration1 = 300;
int update_duration2 = 1000;

// Air-Cond Control Variables (Default)
int on_off=0;
int temp_display=24;
int fan=1; 
int state=0;
int mode=0;
int timer=0;

void eeprom_read(){
  temp_display = readIntFromEEPROM(20);
  fan = readIntFromEEPROM(30);
  state = readIntFromEEPROM(40);
  mode = readIntFromEEPROM(50);
  timer = readIntFromEEPROM(60);
}

void remote_decode(){
  if (IrReceiver.decode()) {
    uint16_t command = IrReceiver.decodedIRData.command;

    unsigned long currentMillis = millis();    
    if(currentMillis-previousMillis > update_duration){ 
      previousMillis = currentMillis;                     // Reset counter

      if(command==69 || command==70 || command==71){      // On/Off
        if(on_off==0) on_off=1;
        else on_off=0;
        Serial.println(on_off);
      }
      
      // Only allows control when is ON
      if(on_off==1){
        if(command==24){                                    // Temp+
          if(temp_display<30) temp_display++;                     
        }
        if(command==82){                                    // Temp-
          if(temp_display>16) temp_display--;                    
        }
        if(command==8){                                     // Mode
          if(mode<2) mode++;
          else mode=0;
        }
        if(command==90){                                    // Fan
          if(fan<2) fan++;
          else fan=0;
        }
        if(command==22) state=1;                            // Hot Mode
        if(command==13) state=0;                            // Cold Mode
        if(command==25){
          if(timer<3) timer++;
          else timer=0;
        }
      }
    }
    IrReceiver.resume();
  }
}

void data_encode(){
  // Temperature
  data[0]=String(temp_display)+"C";

  // Fan
  String temp;
  if(fan==0) temp = "LOW";
  if(fan==1) temp = "NORMAL";
  if(fan==2) temp = "HIGH";
  data[1]=temp;

  // State
  String temp2;
  if(state==0) temp2 = "COOL";
  if(state==1) temp2 = "HEAT";
  data[2]=temp2;

  // Mode
  String temp3;
  if(mode==0) temp3 = "AUTO";
  if(mode==1) temp3 = "DRY";
  if(mode==2) temp3 = "TURBO";
  data[3]=temp3;

  // Timer
  String temp4;
  if(timer==0) temp4 = "OFF";
  if(timer==1) temp4 = "3HRS";
  if(timer==2) temp4 = "6HRS";
  if(timer==3) temp4 = "9HRS";
  data[4]=temp4;
}

void oled_control(){
  if(on_off==0)  u8g2.clear();
  if(on_off==1){
    u8g2.setFont(u8g2_font_bpixel_tr);
    u8g2.firstPage();
    do {
      for(int i=0;i<5;i++){
        u8g2.setCursor(5, 7+i*14);    // 64 Lines: 7,21,35,49,62
        u8g2.print(name[i]+": "+data[i]);
      }
    } while ( u8g2.nextPage() );  
  }
}

void eeprom_update(){
    unsigned long currentMillis = millis();    
    if(currentMillis-previousMillis2 > update_duration2){ 
      previousMillis2 = currentMillis; 
    
      writeIntIntoEEPROM(10, on_off);           // ON/OFF
      writeIntIntoEEPROM(20, temp_display);     // TEMP
      writeIntIntoEEPROM(30, fan);              // FAN
      writeIntIntoEEPROM(40, state);            // STATE
      writeIntIntoEEPROM(50, mode);             // MODE
      writeIntIntoEEPROM(60, timer);            // TIMER
      EEPROM.commit();
    }    
}

void setup() {
  Serial.begin(115200);
  IrReceiver.begin(IR_RECEIVE_PIN, ENABLE_LED_FEEDBACK); 
  u8g2.begin();
  EEPROM.begin(1024);
  eeprom_read();
}

void loop() {
  remote_decode();
  data_encode();
  oled_control();
  eeprom_update();
}