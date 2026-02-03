#include <Servo.h>

const int LEFT_DRIVE = 5;
const int RIGHT_DRIVE = 6;

const int LEFT_PHOTO = A0;
const int RIGHT_PHOTO = A1;
const int ULTRA = 7;
const int RED_LED = 2;
const int GREEN_LED = 3;
const int BLUE_LED = 4;

Servo leftDrive; //aw hell naw who put objects in my c
Servo rightDrive;

void servoWrite(Servo *servo, int value) {
  if(servo == &leftDrive) { //dont do this
      value = value * -1;
  }
  (*servo).writeMicroseconds(map(value, -1, 1, 500, 2500));
}

int photoRead(int photo) {
  return map(analogRead(photo), 200, 750, 0, 1000);
}

void setup() {
  Serial.begin(9600);
  pinMode(RED_LED, OUTPUT);
  pinMode(GREEN_LED, OUTPUT);
  pinMode(BLUE_LED, OUTPUT);
  pinMode(ULTRA, INPUT);
  leftDrive.attach(LEFT_DRIVE);
  rightDrive.attach(RIGHT_DRIVE);
}

void loop() {
  servoWrite(&leftDrive, photoRead(LEFT_PHOTO)/1000);
  servoWrite(&rightDrive, photoRead(RIGHT_PHOTO)/1000);
}
