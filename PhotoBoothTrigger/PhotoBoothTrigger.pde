/*
  Use a button to trigger some external function. 
*/

#define EXTERNAL_BUTTON 9
#define LED_PIN BOARD_LED_PIN

void setup() {
    //SerialUSB.end();
    Serial2.begin(115200);
    pinMode(LED_PIN, OUTPUT);
    pinMode(EXTERNAL_BUTTON, INPUT_PULLDOWN);
    attachInterrupt(EXTERNAL_BUTTON, buttonHandler, RISING);
    digitalWrite(LED_PIN, LOW);
}

void loop() {
  if (SerialUSB.available()) {
    Serial2.print(SerialUSB.read());
  }
}

void buttonHandler() {
    digitalWrite(LED_PIN, HIGH);
    //Serial2.println('hello world!', BYTE);
    delay(500);
    digitalWrite(LED_PIN, LOW);
}

