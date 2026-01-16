class Player {
  final float MAX_SPEED = 4;
  final float ACCELERATION = 1;
  final float DECELERATION = 1;
  
  boolean up;
  boolean down;
  boolean left;
  boolean right;
  
  float x;
  float y;
  float xV;
  float yV;
  
  Player() {
    x = 400;
    y = 400;
  }
  
  void update() {
    float horizontal = (left ? -1 : 0) + (right ? 1 : 0);
    float vertical = (up ? -1 : 0) + (down ? 1 : 0);
    if(horizontal == 0) {
      if(abs(xV) <= DECELERATION) {
        xV = 0;
      } else {
        xV -= DECELERATION * (xV/abs(xV));
      }
    } else {
      xV += ACCELERATION * horizontal;
      xV = constrain(xV, -MAX_SPEED, MAX_SPEED);
    }
    if(vertical == 0) {
      if(abs(yV) <= DECELERATION) {
        yV = 0;
      } else {
        yV -= DECELERATION * (yV/abs(yV));
      }
    } else {
      yV += ACCELERATION * vertical;
      yV = constrain(yV, -MAX_SPEED, MAX_SPEED);
    }
    x += xV;
    y += yV;
  }
  
  void draw() {
    push();
      translate(x, y);
      ellipse(0, 0, 50, 50);
    pop();
  }
  
  void keyPressed() {
   switch(key) {
      case 'w': case 'W':
        up = true;
      break;
      case 's': case 'S':
        down = true;
      break;
      case 'a': case 'A':
        left = true;
      break;
      case 'd': case 'D':
        right = true;
      break;
    }
    if(key == CODED) {
      switch(keyCode) {
        case UP:
          up = true;
        break;
        case DOWN:
          down = true;
        break;
        case LEFT:
          left = true;
        break;
        case RIGHT:
          right = true;
        break;
      }
    }
  }
  
  void keyReleased() {
     switch(key) {
      case 'w': case 'W':
        up = false;
      break;
      case 's': case 'S':
        down = false;
      break;
      case 'a': case 'A':
        left = false;
      break;
      case 'd': case 'D':
        right = false;
      break;
    }
    if(key == CODED) {
      switch(keyCode) {
        case UP:
          up = false;
        break;
        case DOWN:
          down = false;
        break;
        case LEFT:
          left = false;
        break;
        case RIGHT:
          right = false;
        break;
      }
    }
  }
}
