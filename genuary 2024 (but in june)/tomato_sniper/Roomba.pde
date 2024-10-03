class Roomba
{
  float x;
  float y;
  PImage me;
  PImage[] expresions;
  int state = 0;
  float yV = 0;
  float xV = 0;
  boolean stop;
  
  int flicker = (int) random(10, 100);
  int toIdle = 30;
  
  Roomba(float x, float y)
  {
    this.x = x;
    this.y = y;
    me = loadImage("roomba.png");
    expresions = new PImage[7];
    expresions[0] = loadImage("idle.png");
    expresions[1] = loadImage("happy.png");
    expresions[2] = loadImage("hurt.png");
    expresions[3] = loadImage("left.png");
    expresions[4] = loadImage("right.png");
    expresions[5] = loadImage("center.png");
    expresions[6] = loadImage("aim.png");
    me.resize(0, 150);
    expresions[0].resize(0, 150);
    expresions[1].resize(0, 150);
    expresions[2].resize(0, 125);
    expresions[3].resize(0, 150);
    expresions[4].resize(0, 125);
    expresions[5].resize(0, 150);
    expresions[6].resize(0, 150);
  }
  
  void draw()
  {
    if(!stop)
    {
      x += xV * 2;
      y += yV * 2;
    }
    
    if(toIdle <= 0)
    {
      if(xV < 0)
      {
        state = 3;
      }
      else if(xV > 0)
      {
        state = 4;
      }
      else if(yV != 0)
      {
        state = 5;
      }
      else
      {
        state = 0;
      }
    }
    else
    {
      toIdle--;
    }
    if(stop)
    {
      state = 6;
    }
    
    x = constrain(x, 60, width - 43);
    y = constrain(y, 50, height - 55);
    
    image(me, x - me.width/2, y - me.height/2);
    flicker--;
    if(flicker <= 0)
    {
      if(flicker <= -10)
      {
        flicker = (int) random(10, 100);
      }
    }
    else
    {
      switch(state)
      {
        case 0:
          image(expresions[0], x - expresions[0].width/2, y - expresions[0].height/2);
          break;
        case 1:
          image(expresions[1], x - expresions[1].width/2 - 2, y - expresions[1].height/2 - 5);
          break;
        case 2:
          image(expresions[2], x - expresions[2].width/2 - 10, y - expresions[2].height/2);
          break;
        case 3:
          image(expresions[3], x - expresions[3].width/2 - 17, y - expresions[3].height/2 + 10 * yV);
          break;
        case 4:
          image(expresions[4], x - expresions[4].width/2 - 17, y - expresions[4].height/2 - 8 + 10 * yV);
          break;
        case 5:
          image(expresions[5], x - expresions[5].width/2 - 17, y - expresions[5].height/2 + 10 * yV);
          break;
         case 6:
          image(expresions[6], x - expresions[5].width/2 - 9, y - expresions[5].height/2 + 9);
          break;
      }
    }
  }
  
  void keyPressed()
  {
    switch(key)
    {
      case 'w':
        yV += -1;
        break;
      case 'a':
        xV += -1;
        break;
      case 's':
        yV += 1;
        break;
      case 'd':
        xV += 1;
        break;
    }
  }
  
  void keyReleased()
  {
    switch(key)
    {
      case 'w':
        yV += 1;
        break;
      case 'a':
        xV += 1;
        break;
      case 's':
        yV += -1;
        break;
      case 'd':
        xV += -1;
        break;
    }
  }
}
