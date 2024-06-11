class Particle
{
  float x;
  float y;
  float xV;
  float yV;
  int type;
  
  Particle(float x, float y, int type)
  {
    this.x = x;
    this.y = y;
    this.type = type;
  }
  
  void draw()
  {
    if(xV != 0)
    {
      xV -= xV/(1/friction * 1000);
    }
    if(yV != 0)
    {
      yV -= yV/(1/friction * 1000);
    }
    
    xV = constrain(xV, -speedLimit, speedLimit);
    yV = constrain(yV, -speedLimit, speedLimit);
    
    //if(x > width){x = x - width;}
    //if(x < 0){x = x + width;}
    //if(y > height){y = y - height;}
    //if(y < 0){y = y + height;}
    
    if(x > width){x = width; xV = xV * -1;}
    if(x < 0){x = 0; xV = xV * -1;}
    if(y > height){y = height; yV = yV * -1;}
    if(y < 0){y = 0; yV = yV * -1;}
    
    x += xV;
    y += yV;
    
    switch(type)
    {
      case(1):
        fill(#ff0000);
      break;
      case(2):
        fill(#0000ff);
      break;
      case(3):
        fill(#00ff00);
      break;
      case(4):
        fill(#ffff00);
      break;
      case(5):
        fill(#00ffff);
      break;
      case(6):
        fill(#ff00ff);
      break;
      case(7):
        fill(#ff8800);
      break;
      case(8):
        fill(#8800ff);
      break;
      case(9):
        fill(#ffffff);
      break;
      case(10):
        fill(#222222);
      break;
    }
    circle(x, y, 10);
  }
}
