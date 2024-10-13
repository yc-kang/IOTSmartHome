#define LATCH_PIN 14    // Latch (74HC595)
#define CLK_PIN   12    // Clock (74HC595)
#define DATA_PIN  13    // Data (74HC595)

void setup() {
  Serial.begin(115200);
  pinMode(LATCH_PIN, OUTPUT);
  pinMode(CLK_PIN, OUTPUT);
  pinMode(DATA_PIN, OUTPUT);
}

void loop(){
  digitalWrite(LATCH_PIN, LOW);
  shiftOut(DATA_PIN, CLK_PIN, MSBFIRST, 255);
	digitalWrite(LATCH_PIN, HIGH);
  delay(1000);
}