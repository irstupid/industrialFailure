class Player
{
  float ACCELERATION = 0.5;
  float DECELERATION = 2;
  float SPEED = 5;
  float GRAVITY = 0.419;
  float COYOTE_TIME = 8;
  float JUMP = 10;
  float WIDTH = 50;
  float HEIGHT = 50;
  float[][] CHECK_LOCATIONS = 
  { {-WIDTH/2 + 10, HEIGHT/2 + 1},
    {WIDTH/2 - 10, HEIGHT/2 + 1},
    {WIDTH/2 + 1, HEIGHT/2 - 10},
    {WIDTH/2 + 1, -HEIGHT/2 + 10},
    {WIDTH/2 - 10, -HEIGHT/2 - 1},
    {-WIDTH/2 + 10, -HEIGHT/2 - 1},
    {-WIDTH/2 - 1, -HEIGHT/2 + 10},
    {-WIDTH/2 - 1, HEIGHT/2 - 10} } ;
  
  float x, y;
  float xV, yV;
  float[] checks = new float[8];
  float coyoteTime;
  
  boolean left, right, jump;
  
  Player()
  {
    
  }
  
  void draw()
  {
    rect(x, y, 50, 50);
  }
  
  void setCheck(int i, float value)
  {
    checks[i] = value;
  }
  
  void collide()
  {
    float level;
    level = min(checks[0], checks[1]);
    if(level <= 0)
    {
      y += level;
      yV = 0;
      coyoteTime = COYOTE_TIME;
    }
    else if(coyoteTime > 0)
    {
      coyoteTime--;
    }
    boolean leftCollision = false;
    level = min(checks[2], checks[3]);
    if(level <= 0)
    {
      leftCollision = true;
      x += level;
    }
    level = min(checks[4], checks[5]);
    if(level <= 0)
    {
      y -= level;
      yV = 0;
    }
    boolean rightCollision = false;
    level = min(checks[6], checks[7]);
    if(level <= 0)
    {
      rightCollision = true;
      x -= level;
    }
    if(leftCollision != rightCollision)
    {
      xV = 0;
    }
  }
  
  void move()
  {
    xV += ACCELERATION * (left ? 0 : 1);
    xV += ACCELERATION * (right ? 0 : -1);
    xV = constrain(xV, -SPEED, SPEED);
    if(left == right)
    {
      if(abs(xV) < DECELERATION)
      {
        xV = 0;
      }
      else
      {
        xV -= DECELERATION * xV/abs(xV);
      }
    }
    
    yV += GRAVITY;
    if(jump && coyoteTime > 0)
    {
      coyoteTime = 0;
      yV = -JUMP;
    }
    
    x += xV;
    y += yV;
  }
  
  float getX() { return x; }
  float getY() { return y; }
  
  void keyPressed()
  {
    switch(key)
    {
      case 'a':
        left = true;
      break;
      case 'd':
        right = true;
      break;
      case 'w':
        jump = true;
      break;
    }
  }
  
  void keyReleased()
  {
    switch(key)
    {
      case 'a':
        left = false;
      break;
      case 'd':
        right = false;
      case 'w':
        jump = false;
      break;
    }
  }
}
