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
    x += cos(radians(r));
    y += sin(radians(r));
    if(active)
    {
      image(crosshair, x - crosshair.width/2 + 5.5, y - crosshair.height/2 - 6);
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
    }
  }
}
