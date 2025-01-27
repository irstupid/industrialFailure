class Fighter
{
  float ACCELERATION = 0.4;
  float AIR_ACCELERATION = 0.2;
  float MAX_SPEED = 5;
  float DECELERATION = 0.6;
  float JUMP = 2;
  float MAX_JUMP = 15;
  float MAX_HP = 100;
  float GRAVITY = 0.6;
  float SLOW_FALL = 0.2;
  float WIDTH = 100;
  float HEIGHT = 100;
  
  int hp;
  float x;
  float y;
  float xV;
  float yV;
  int xD;
  int yD;
  boolean grounded;
  boolean doubleJump;
  boolean jumping;
  boolean shielding;
  
  int frame;
  int animation;
  PImage[][] sprites;
  
  boolean[] keys = new boolean[8];
  boolean[] pKeys = new boolean[8];
  boolean[] instantKeys = new boolean[8];
  
  boolean red = true;
  
  public void update() 
  { 
    shield();
    if(!shielding)
    {
      fall();
      jump();
      move();
      atack();
    }
    updateKeys();
  }
  
  public void draw() { }
  
  private void shield()
  {
    if(grounded && instantKeys[5])
    {
      shielding = true;
      xV = 0;
      yV = 0;
    }
    else if(!keys[5])
    {
      shielding = false;
    }
  }
  
  private void atack()
  {
    if(instantKeys[6])
    {
      if(yD == 1)
      {
        if(grounded)
        {
          upSmall();
        }
        else
        {
          upSmallAir();
        }
      }
      else if(yD == -1)
      {
        if(grounded)
        {
          downSmall();
        }
        else
        {
          downSmallAir();
        }
      }
      else
      {
        if(xD != 0)
        {
          if(grounded)
          {
            sideSmall();
          }
          else
          {
            sideSmallAir();
          }
        }
        else
        {
          if(grounded)
          {
            neutralSmall();
          }
          else
          {
            neutralSmallAir();
          }
        }
      }
    }
    else if(instantKeys[7])
    {
      if(yD == 1)
      {
        if(grounded)
        {
          upBig();
        }
        else
        {
          upBigAir();
        }
      }
      else if(yD == -1)
      {
        if(grounded)
        {
          downBig();
        }
        else
        {
          downBigAir();
        }
      }
      else
      {
        if(xD != 0)
        {
          if(grounded)
          {
            sideBig();
          }
          else
          {
            sideBigAir();
          }
        }
        else
        {
          if(grounded)
          {
            neutralBig();
          }
          else
          {
            neutralBigAir();
          }
        }
      }
    }
  }
  
  private void jump()
  {
    if((grounded || doubleJump) && instantKeys[4])
    {
      jumping = true;
      doubleJump = false;
      yV = 0;
    }
    if(jumping && keys[4] && yV >= -MAX_JUMP)
    {
      yV -= JUMP;
    }
    else
    {
      jumping = false;
    }
    
    if(grounded)
    {
      doubleJump = true;
    }
  }
  
  private void fall()
  {
    if(grounded)
    {
      yV = min(yV, 0);
    }
    else if(!jumping)
    {
      if(keys[4] && yV > 0)
      {
        yV += SLOW_FALL;
      }
      else
      {
        yV += GRAVITY;
      }
    }
  }
  
  private void move()
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
    else
    {
      if(xD != 0)
      {
        if((xV != 0 && xD != xV/abs(xV)))
        {
          xV -= DECELERATION * xV/abs(xV);
        }
        else
        {
          xV += ACCELERATION * xD;
        }
      }
    }
    xV = constrain(xV, -MAX_SPEED, MAX_SPEED);
    
    x += xV;
    y += yV;
  }
  
  private void updateKeys()
  {
    for(int i = 0; i < keys.length; i++)
    {
      if(keys[i] && !pKeys[i])
      {
        instantKeys[i] = true;
      }
      else
      {
        instantKeys[i] = false;
      }
      
      pKeys[i] = keys[i];
    }
  }
  
  private void neutralSmall() { println("neutralSmall"); }
  
  private void sideSmall() { println("sideSmall"); }
  
  private void upSmall() { println("upSmall"); }
  
  private void downSmall() { println("downSmall"); }
  
  private void neutralBig() { println("neutralBig"); }
  
  private void sideBig() { println("sideBig"); }
  
  private void upBig() { println("upBig"); }
  
  private void downBig() { println("downBig"); }
  
  private void neutralSmallAir() { println("neutralSmallAir"); }
  
  private void sideSmallAir() { println("sideSmallAir"); }
  
  private void upSmallAir() { println("upSmallAir"); }
  
  private void downSmallAir() { println("downSmallAir"); }
  
  private void neutralBigAir() { println("neutralBigAir"); }
  
  private void sideBigAir() { println("sideBigAir"); }
  
  private void upBigAir() { println("upBigAir"); }
  
  private void downBigAir() { println("downBigAir"); }
  
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
