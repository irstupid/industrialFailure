#include <Servo.h>
#include <IRremote.h>

enum Button {
  PWR = 0xba45ff00,
  VOL_P = 0xb946ff00,
  FUNC = 0xb847ff00,
  LEFT = 0xbb44ff00,
  PAUSE = 0xbf40ff00,
  RIGHT = 0xbc43ff00,
  DOWN = 0xf807ff00,
  VOL_M = 0xea15ff00,
  UP = 0xf609ff00,
  ZERO = 0xe916ff00,
  EQ = 0xe619ff00,
  ST = 0xf20dff00,
  ONE = 0xf30cff00,
  TWO = 0xe718ff00,
  THREE = 0xa15eff00,
  FOUR = 0xf708ff00,
  FIVE = 0xe31cff00,
  SIX = 0xa55aff00,
  SEVEN = 0xbd42ff00,
  EIGHT = 0xad52ff00,
  NINE = 0xb54aff00,
  HELD = 0,
};

enum Mode {
  NORMAL,
  FOLLOW
};

const int LEFT_DRIVE = 5;
const int RIGHT_DRIVE = 6;
const int TRUE_STOP = 7;

const int LEFT_PHOTO = A0;
const int RIGHT_PHOTO = A1;
const int ULTRA = 7;
const int RED_LED = 2;
const int GREEN_LED = 3;
const int BLUE_LED = 4;

const int IR = 8;
const int LED_BOARD = 9;

Servo leftDrive; //aw hell naw who put objects in my c
Servo rightDrive;

const double LEFT_MOD = 1;
const double RIGHT_MOD = 0.5;
const double TURN_SPEED = 0.5;

Mode mode;

decode_results irIn;

int direction = 0;

void servoWrite(Servo *servo, double value) {
  if(servo == &rightDrive) { //dont do this
      value = value * -1 * RIGHT_MOD;
      Serial.println(value);
  } else {
      value = value * LEFT_MOD;
  }
  value = value * 100; //to account for implicit long casting
  (*servo).writeMicroseconds(map(value, -1000, 1000, 500, 2500));
}

int photoRead(int photo) {
  return map(analogRead(photo), 200, 750, 0, 1000);
}

Button IRread() {
  if(!IrReceiver.decode()) {
    return NULL;
  }
  Button out = IrReceiver.decodedIRData.decodedRawData;
  IrReceiver.resume(); 
  return out;
} 

void setup() {
  Serial.begin(9600);
  pinMode(RED_LED, OUTPUT);
  pinMode(GREEN_LED, OUTPUT);
  pinMode(BLUE_LED, OUTPUT);
  pinMode(ULTRA, INPUT);
  leftDrive.attach(LEFT_DRIVE);
  rightDrive.attach(RIGHT_DRIVE);
  IrReceiver.begin(IR);
}

void loop() {

  switch(IRread()) {
    case PWR:
      switch(mode) {
        case NORMAL:
          digitalWrite(RED_LED, 1);
          digitalWrite(GREEN_LED, 0);
          digitalWrite(BLUE_LED, 0);
        break;
      }
      break;
    case VOL_P:
      digitalWrite(RED_LED, 0);
      digitalWrite(GREEN_LED, 1);
      digitalWrite(BLUE_LED, 0);
      break;
    case FUNC:
      digitalWrite(RED_LED, 0);
      digitalWrite(GREEN_LED, 0);
      digitalWrite(BLUE_LED, 1);
      break;
    case VOL_M:
      digitalWrite(RED_LED, 0);
      digitalWrite(GREEN_LED, 0);
      digitalWrite(BLUE_LED, 0);
      break;
    case UP:
      digitalWrite(TRUE_STOP, 1);
      servoWrite(&leftDrive, 1);
      servoWrite(&rightDrive, 1);
      break;
    case LEFT:
      digitalWrite(TRUE_STOP, 1);
      servoWrite(&leftDrive, -TURN_SPEED);
      servoWrite(&rightDrive, TURN_SPEED);
      break;
    case DOWN:
      digitalWrite(TRUE_STOP, 1);
      servoWrite(&leftDrive, -1);
      servoWrite(&rightDrive, -1);
      break;
    case RIGHT:
      digitalWrite(TRUE_STOP, 1);
      servoWrite(&leftDrive, TURN_SPEED);
      servoWrite(&rightDrive, -1);
      break;
    case PAUSE:
      servoWrite(&leftDrive, 0);
      servoWrite(&rightDrive, 0);
      digitalWrite(TRUE_STOP, 0);
      break;
  }
}
