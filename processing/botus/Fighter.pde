class Fighter
{
  final float ACCELERATION = 0.2;
  final float AIR_ACCELERATION = 0.1;
  final float MAX_SPEED = 5;
  final float DECELERATION = 0.6;
  final float MAX_HP = 100;
  final float GRAVITY = -5;
  
  int hp;
  float x;
  float y;
  float xV = 0;
  float yV;
  int xD;
  int yD;
  boolean grounded = true;
  
  int frame;
  int animation;
  PImage[][] sprites;
  
  private boolean[] keys = new boolean[8];
  
  private boolean red = true;
  
  public void update() 
  { 
    move();
  }
  
  public void draw() { }
  
  public void move()
  {
    yD = (keys[0] ? 1 : 0) + (keys[2] ? -1 : 0);
    xD = (keys[1] ? -1 : 0) + (keys[3] ? 1 : 0);
    
    if(grounded)
    {
      if((xV != 0 && xD != xV/abs(xV)) || (xD == 0 && xV != 0))
      {
        xV -= DECELERATION * xV/abs(xV);
        if(abs(xV) <= DECELERATION)
        {
          xV = 0;
        }
      }
      else
      {
        xV += ACCELERATION * xD;
      }
    }
    xV = constrain(xV, -MAX_SPEED, MAX_SPEED);
    
    println(xV);
    x += xV;
  }
  
  public void keyPressed()
  {
    if(red)
    {
      switch(key)
      {
        case('w'):
          keys[0] = true;
        break;
        case('a'):
          keys[1] = true;
        break;
        case('s'):
          keys[2] = true;
        break;
        case('d'):
          keys[3] = true;
        break;
        case('1'):
          keys[4] = true;
        break;
        case('2'):
          keys[5] = true;
        break;
        case('3'):
          keys[6] = true;
        break;
        case('4'):
          keys[7] = true;
        break;
      }
    }
    else
    {
      switch(key)
      {
        case('i'):
          keys[0] = true;
        break;
        case('j'):
          keys[1] = true;
        break;
        case('k'):
          keys[2] = true;
        break;
        case('l'):
          keys[3] = true;
        break;
        case('5'):
          keys[4] = true;
        break;
        case('6'):
          keys[5] = true;
        break;
        case('7'):
          keys[6] = true;
        break;
        case('8'):
          keys[7] = true;
        break;
      }
    }
  }
  
  public void keyReleased()
  {
    if(red)
    {
      switch(key)
      {
        case('w'):
          keys[0] = false;
        break;
        case('a'):
          keys[1] = false;
        break;
        case('s'):
          keys[2] = false;
        break;
        case('d'):
          keys[3] = false;
        break;
        case('1'):
          keys[4] = false;
        break;
        case('2'):
          keys[5] = false;
        break;
        case('3'):
          keys[6] = false;
        break;
        case('4'):
          keys[7] = false;
        break;
      }
    }
    else
    {
      switch(key)
      {
        case('i'):
          keys[0] = false;
        break;
        case('j'):
          keys[1] = false;
        break;
        case('k'):
          keys[2] = false;
        break;
        case('l'):
          keys[3] = false;
        break;
        case('5'):
          keys[4] = false;
        break;
        case('6'):
          keys[5] = false;
        break;
        case('7'):
          keys[6] = false;
        break;
        case('8'):
          keys[7] = false;
        break;
      }
    }
  }
}
