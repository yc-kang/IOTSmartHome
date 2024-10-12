int motorA = 14;
int motorB = 12;

void setup() {
  // put your setup code here, to run once:
  pinMode(motorA,OUTPUT);
  pinMode(motorB,OUTPUT);
  digitalWrite(motorA,0);
  digitalWrite(motorB,0);
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(motorA,1);
  digitalWrite(motorB,0);
  delay(2000);
  
  digitalWrite(motorA,0);
  digitalWrite(motorB,1);
  delay(2000);
}
