#include <Arduino.h>

// select only NEC and the universal decoder for pulse distance protocols
#define DECODE_NEC          // Includes Apple and Onkyo
#define DECODE_DISTANCE_WIDTH // In case NEC is not received correctly. Universal decoder for pulse distance width protocols

#include "PinDefinitionsAndMore.h" // Define macros for input and output pin etc.
#include <IRremote.hpp>

void setup() {
    Serial.begin(115200);
    IrReceiver.begin(IR_RECEIVE_PIN, ENABLE_LED_FEEDBACK);
    IrSender.begin(); // Start with IR_SEND_PIN as send pin and enable feedback LED at default feedback LED pin
}

uint16_t sAddress = 0xFF00;
uint8_t sCommand = 0x45;
uint8_t sRepeats = 2;


void send_ir_data() {
    Serial.print(F("Sending: 0x"));
    Serial.print(sAddress, HEX);
    Serial.print(sCommand, HEX);
    Serial.println(sRepeats, HEX);
    Serial.flush(); // To avoid disturbing the software PWM generation by serial output interrupts

    // Results for the first loop to: Protocol=NEC Address=0x102 Command=0x34 Raw-Data=0xCB340102 (32 bits)
    //IrSender.sendNEC(sAddress, sCommand, sRepeats);
    IrSender.sendNEC(0xFF00, 69, 2);
}
/*
void receive_ir_data() {
    if (IrReceiver.decode()) {
        Serial.print(F("Decoded protocol: "));
        Serial.print(getProtocolString(IrReceiver.decodedIRData.protocol));
        Serial.print(F(", decoded raw data: "));
#if (__INT_WIDTH__ < 32)
        Serial.print(IrReceiver.decodedIRData.decodedRawData, HEX);
#else
        PrintULL::print(&Serial, IrReceiver.decodedIRData.decodedRawData, HEX);
#endif
        Serial.print(F(", decoded address: "));
        Serial.print(IrReceiver.decodedIRDataaddress, HEX);
        Serial.print(F(", decoded command: "));
        Serial.println(IrReceiver.decodedIRData.command, DEC);
        IrReceiver.resume();
    }
}*/

void loop() {
    Serial.println();
    Serial.print(F("address=0x"));
    Serial.print(sAddress, HEX);
    Serial.print(F(" command=0x"));
    Serial.print(sCommand, HEX);
    Serial.print(F(" repeats="));
    Serial.println(sRepeats);
    Serial.flush();

    send_ir_data();
    IrReceiver.restartAfterSend(); // Is a NOP if sending does not require a timer.

    // wait for the receiver state machine to detect the end of a protocol
    delay((RECORD_GAP_MICROS / 1000) + 5);
    
    //receive_ir_data();
    delay(100); // Loop delay
}
