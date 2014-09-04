const int ledPin=9;
const int senser=3;

void setup (){
  pinMode(ledPin,OUTPUT);
  Serial.begin(9600);
}

void loop() {
  int value;
  value = analogRead(senser);
  //Serial.println(value);
  Serial.write(value);
  if (value < 15){ //検知
    digitalWrite(ledPin,HIGH);
    Serial.print("enemy found\n");
    //Serial.write(value);
  } else {
    digitalWrite(ledPin,LOW);
  }
  delay(1000);
}
