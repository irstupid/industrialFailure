class Tank
{
  boolean up;
  boolean down;
  boolean left;
  boolean right;
  boolean drive;
  
  float x;
  float y;
  float r = 90;
  float turretR;
  
  float v;
  float rV;
  float turretRV;
  float targetR;
  
  int team;
  
  float turretTurnSpeed = 2.5;
  float turnSpeed = 1;
  float speed = 3;
  
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  int reloadTime;
  
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
    if(r >= 360)
    {
      r = 0;
    }
    if(r < 0)
    {
      r = 360;
    }
    
    reloadTime--;
    
    turnTurret();
    drive();
    
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
        case('1'):
          drive = true;
          break;
        case('2'):
          shoot();
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
          break;
        case('s'):
          down = false;
          break;
        case('a'):
          left = false;
          break;
        case('d'):
          right = false;
          break;
        case('1'):
          drive = false;
          break;
      }
    }
  }
  
  void drive()
  {
    if(drive)
    {
      if((up || down || left || right) && turretR != r)
      {
        float d = r - turretR;
        if(d >= 180)
        {
          rV = (d)/abs(d) * turretTurnSpeed;
        }
        else
        {
          if(d >= -180)
          {
            rV = -1 * (d)/abs(d) * turretTurnSpeed;
          }
          else
          {
            rV = (d)/abs(d) * turretTurnSpeed;
          }
        }
        
        v = 0;
      }
      else
      {
        rV = 0;
        v = speed;
      }
    }
    else
    {
      rV = 0;
      v = 0;
    }
    
    r += rV;
    x += cos(radians(-r)) * v;
    y += sin(radians(-r)) * v;
  }
  
  void turnTurret()
  {
    if((up || down || left || right) && turretR != targetR)
    {
      if(turretR - targetR >= 180)
      {
        turretRV = (turretR - targetR)/abs(turretR - targetR) * turnSpeed;
      }
      else
      {
        if(turretR - targetR >= -180)
        {
          turretRV = -1 * (turretR - targetR)/abs(turretR - targetR) * turnSpeed;
        }
        else
        {
          turretRV = (turretR - targetR)/abs(turretR - targetR) * turnSpeed;
        }
      }
    }
    else
    {
      turretRV = 0;
    }
    turretR += turretRV;
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
    pop();
    for(int i = 0; i < bullets.size(); i++)
    {
      bullets.get(i).draw();
    }
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
        rotate(radians(-turretR));
        translate(width/160, 0);
        rect(0, 0, width/40, width/80);
      pop();
    pop();
  }
  
  void shoot()
  {
    if(reloadTime < 0)
    {
      reloadTime = 60;
      bullets.add(new Bullet(x + (cos(radians(-turretR)) * width/40), y + (sin(radians(-turretR)) * width/40), cos(radians(-turretR)) * 4, sin(radians(-turretR)) * 4));
    }
  }
}
