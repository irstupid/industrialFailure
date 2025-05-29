class Player
{
  float ACCELERATION = 0.5;
  float DECELERATION = 2;
  float SPEED = 5;
  
  float x, y;
  float xV, yV;
  
  boolean left, right;
  
  Player()
  {
    
  }
  
  void draw()
  {
    rect(x, y, 50, 50);
  }
  
  void update()
  {
    move();
    
    x += xV;
    y += yV;
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
  }
  
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
      break;
    }
  }
}
