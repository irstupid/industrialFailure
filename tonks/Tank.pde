class Tank
{
  boolean up;
  boolean down;
  boolean left;
  boolean right;
  
  float x;
  float y;
  float r = 90;
  float turretR;
  
  float v;
  float rV;
  float turretRV;
  float targetR;
  
  int team;
  
  Tank(float x, float y, int team)
  {
    this.x = x;
    this.y = y;
    this.team = team;
  }
  
  void draw()
  {
    
    switch((up ? 1 : 0) + (right ? 2 : 0) + (down ? 4 : 0) + (left ? 8 : 0))
    {
      case(1):
          targetR = 90;
          break;
      case(2):
          targetR = 0; 
          break;
      case(3):
          targetR = 45; 
          break;
      case(4):
          targetR = 270;
          break;
      case(6):
          targetR = 315; 
          break;
      case(8):
          targetR = 180;
          break;
      case(9):
          targetR = 135;
          break;
      case(12):
          targetR = 225;
          break;
    }
    
    if(turretR >= 360)
    {
      turretR = 0;
    }
    if(turretR < 0)
    {
      turretR = 360;
    }
    println(turretR);
    
    turn();
    
    turretR += turretRV;
    
    tank();
  }
  
  void keyPressed()
  {
    if(team == 0)
    {
      switch(key)
      {
        case('w'):
          up = true;
          break;
        case('s'):
          down = true;
          break;
        case('a'):
          left = true;
          break;
        case('d'):
          right = true;
          break;
      }
    }
  }
  
  void keyReleased()
  {
    if(team == 0)
    {
      switch(key)
      {
        case('w'):
          up = false;
        case('s'):
          down = false;
        case('a'):
          left = false;
        case('d'):
          right = false;
      }
    }
  }
  
  void turn()
  {
    if((up || down || left || right) && turretR != targetR)
    {
      if(turretR - targetR >= 180)
      {
        turretRV = (turretR - targetR)/abs(turretR - targetR);
      }
      else
      {
        if(turretR - targetR >= -180)
        {
          turretRV = -1 * (turretR - targetR)/abs(turretR - targetR);
        }
        else
        {
          turretRV = (turretR - targetR)/abs(turretR - targetR);
        }
      }
    }
    else
    {
      turretRV = 0;
    }
  }
  
  void tank()
  {
    push();
      switch(team)
      {
        case(0):
          fill(#ff0000);
          break;
        case(1):
          fill(#0000ff);
          break;
      }
      rectMode(CENTER);
      translate(x, y);
      push();
        rotate(radians(-r));  
        rect(0, 0, width/20, width/40);
      pop();
      push();
        rotate(radians(-turretR));
        translate(width/160, 0);
        rect(0, 0, width/40, width/80);
      pop();
    pop();
  }
}
