#include <EEPROM.h>

void writeIntIntoEEPROM(int address, int number)
{ 
  EEPROM.write(address, number >> 8);
  EEPROM.write(address + 1, number & 0xFF);
}
int readIntFromEEPROM(int address)
{
  return (EEPROM.read(address) << 8) + EEPROM.read(address + 1);
}

/*
//Default Values
int on_off = 0;         // ON/OFF: OFF=0, ON=1
int temp_display = 24;  // TEMP: Degree Celcius
int fan = 1;            // FAN: LOW=0, NORMAL=1, HIGH=2
int state = 0;          // STATE: COOL=0, HOT=1
int mode = 0;           // MODE: AUTO=0, DRY=1, TURBO=2
int timer = 0;          // TIMER: OFF=0, 3hrs=1, 6hrs=2, 9hrs=3
*/

void setup() {
  Serial.begin(115200);
  EEPROM.begin(1024);
  /*
  writeIntIntoEEPROM(10, 0); 
  writeIntIntoEEPROM(20, 24);
  writeIntIntoEEPROM(30, 1);
  writeIntIntoEEPROM(40, 0);
  writeIntIntoEEPROM(50, 0);
  writeIntIntoEEPROM(60, 0);
  EEPROM.commit();*/

  Serial.println("10: "+String(readIntFromEEPROM(10)));
  Serial.println("20: "+String(readIntFromEEPROM(20)));
  Serial.println("30: "+String(readIntFromEEPROM(30)));
  Serial.println("40: "+String(readIntFromEEPROM(40)));
  Serial.println("50: "+String(readIntFromEEPROM(50)));
  Serial.println("60: "+String(readIntFromEEPROM(60)));
}
void loop() {}