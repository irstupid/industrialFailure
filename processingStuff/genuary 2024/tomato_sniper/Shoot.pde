class Shoot
{
  int charge;
  float x;
  float y;
  float r;
  boolean active = false;
  PImage crosshair;
  
  boolean up;
  boolean down;
  boolean left;
  boolean right;
  
  float speed;
  int pressTime;
  float SPEED = 10;
  int ACLTIME;
  float ACCELERATION = 0.1;
  
  Shoot()
  {
    crosshair = loadImage("target.png");
    crosshair.resize(200, 0);
  }
  
  void draw()
  {   
    switch((up ? 1 : 0) + (right ? 2 : 0) + (down ? 4 : 0) + (left ? 8 : 0))
    {
      case(1):
        r = 90;
        break;
      case(2):
        r = 0; 
        break;
      case(3):
        r = 45; 
        break;
      case(4):
        r = 270;
        break;
      case(6):
        r = 315; 
        break;
      case(8):
        r = 180;
        break;
      case(9):
        r = 135;
        break;
      case(12):
        r = 225;
        break;
    }
    if((up || down || left || right) && active)
    {
      pressTime++;
      if(speed < SPEED && pressTime > ACLTIME)
      {
        speed += speed * ACCELERATION;
      }
    }
    else
    {
      pressTime = 0;
      speed = 1;
    }
    x += cos(radians(r)) * speed;
    y -= sin(radians(r)) * speed;
    if(active)
    {
      for(int i = 0; i < tomatos.size(); i++)
      {
        if(dist(tomatos.get(i).x, tomatos.get(i).y + 10, x, y) < 75)
        {
          charge += 3;
          
          if(charge > 100)
          {
            charge = 100;
          }
          break;
        }
        if(i == tomatos.size() - 1)
        {
          charge -= 10;
          charge = constrain(charge, 0, 100);
        }
      }
      //println(charge);
      //circle(x, y, 50);
      
      push();
        translate(x, y);
        rotate(radians(charge * 1.35));
        scale(charge/300f + 1);
        translate(-crosshair.width/2 + 5.5, -crosshair.height/2 - 6);
        image(crosshair, 0, 0);
      pop();
    }
  }
  
  void keyPressed()
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
  
  void keyReleased()
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
      case(' '):
        for(int i = 0; i < tomatos.size(); i++)
        {
          if(dist(tomatos.get(i).x, tomatos.get(i).y + 10, x, y) < 75)
          {
            tomatos.get(i).hp -= charge;
          }
        }
        charge = 0;
        break;
    }
  }
}
