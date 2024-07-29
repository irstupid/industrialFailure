class Roomba
{
  float x;
  float y;
  PImage me;
  PImage[] expresions;
  
  int flicker = (int) random(10, 100);
  
  Roomba(float x, float y)
  {
    this.x = x;
    this.y = y;
    me = loadImage("roomba.png");
    expresions = new PImage[6];
    expresions[0] = loadImage("idle.png");
    expresions[1] = loadImage("happy.png");
    expresions[2] = loadImage("hurt.png");
    expresions[3] = loadImage("left.png");
    expresions[4] = loadImage("right.png");
    expresions[5] = loadImage("center.png");
    me.resize(0, 150);
    expresions[0].resize(0, 150);
    expresions[1] = loadImage("happy.png");
    expresions[2] = loadImage("hurt.png");
    expresions[3] = loadImage("left.png");
    expresions[4] = loadImage("right.png");
    expresions[5] = loadImage("center.png");
  }
  
  void draw()
  {
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
      image(expresions[0], x - expresions[0].width/2, y - expresions[0].height/2);
    }
  }
}
