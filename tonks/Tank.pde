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
    println((up ? 1 : 0) + (right ? 2 : 0) + (down ? 4 : 0) + (left ? 8 : 0));
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
    
    if(up || down || left || right)
    {
      if(turretR < targetR)
      {
        turretRV = 1;
      }
      else if(turretR > targetR)
      {
        turretRV = -1;
      }
      else 
      {
        turretRV = 0;
      }
    }
    else
    {
      turretRV = 0;
    }
    
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
        case('s'):
          down = true;
        case('a'):
          left = true;
        case('d'):
          right = true;
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
