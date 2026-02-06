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
  ONE = 12,
  TWO = 13,
  THREE = 14,
  FOUR = 15,
  FIVE = 16,
  SIX = 17,
  SEVEN = 18,
  EIGHT = 19,
  NINE = 20,
  HELD = 0xFFFFFF
};

const int LEFT_DRIVE = 5;
const int RIGHT_DRIVE = 6;

const int LEFT_PHOTO = A0;
const int RIGHT_PHOTO = A1;
const int ULTRA = 7;
const int RED_LED = 2;
const int GREEN_LED = 3;
const int BLUE_LED = 4;

const int IR = 8;

Servo leftDrive; //aw hell naw who put objects in my c
Servo rightDrive;

decode_results irIn;

void servoWrite(Servo *servo, int value) {
  if(servo == &leftDrive) { //dont do this
      value = value * -1;
  }
  (*servo).writeMicroseconds(map(value, -1, 1, 500, 2500));
}

int photoRead(int photo) {
  return map(analogRead(photo), 200, 750, 0, 1000);
}

Button IRread() {
  if(!IrReceiver.decode()) {
      return NULL;
  }
  switch(IrReceiver.decodedIRData.decodedRawData) { //i hate this sytax SO MUCH but i cant think of a better way
    case PWR:
      IrReceiver.resume();
      return PWR;
    case VOL_P:
      IrReceiver.resume();
      return VOL_P;
    case FUNC:
      IrReceiver.resume();
      return FUNC;
    case LEFT:
      IrReceiver.resume();
      return LEFT;
    case PAUSE:
      IrReceiver.resume();
      return PAUSE;
    case RIGHT:
      IrReceiver.resume();
      return RIGHT;
    case DOWN:
      IrReceiver.resume();
      return DOWN;
    case VOL_M:
      IrReceiver.resume();
      return VOL_M;
    case UP:
      IrReceiver.resume();
      return UP;
    case ZERO:
      IrReceiver.resume();
      return ZERO;
    case EQ:
      IrReceiver.resume();
      return EQ;
    case ST:
      IrReceiver.resume();
      return ST;
    case ONE:
      IrReceiver.resume();
      return ONE;
    case TWO:
      IrReceiver.resume();
      return TWO;
    case THREE:
      IrReceiver.resume();
      return THREE;
    case FOUR:
      IrReceiver.resume();
      return FOUR;
    case FIVE:
      IrReceiver.resume();
      return FIVE;
    case SIX:
      IrReceiver.resume();
      return SIX;
    case SEVEN:
      IrReceiver.resume();
      return SEVEN;
    case EIGHT:
      IrReceiver.resume();
      return EIGHT;
    case NINE:
      IrReceiver.resume();
      return NINE;
    case HELD:
      IrReceiver.resume();
      return HELD;
    default:
      Serial.print("unrecognized button ");
      Serial.println(IrReceiver.decodedIRData.decodedRawData, HEX);
      IrReceiver.resume();
      return NULL;
  }
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
  //servoWrite(&leftDrive, photoRead(LEFT_PHOTO)/1000);
  //servoWrite(&rightDrive, photoRead(RIGHT_PHOTO)/1000);
  IRread();
}
