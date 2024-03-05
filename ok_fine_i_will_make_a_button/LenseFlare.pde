class LenseFlare
{
  float x;
  float y;
  int t;
  int c;
  float a = 175;
  int s;
  float sV;
  PImage me;
  
  LenseFlare()
  {
    me = loadImage("lenseFlare.png");
    s = round(random(125, 225));
    sV = random(1, 7) * ((round(random(0, 1)) * -2) + 1);
    x = random(0, width);
    y = random(0, height);
    t = round(random(1, 15));
    c = color(random(0, 1) * 255, random(0, 1) * 255, random(0, 1) * 255);
  }
  
  void draw()
  {
    push();
      tint(c, a);
      me.resize(s, s);
      image(me, x - me.width/2, y - me.height/2);
    pop();
    s += sV;
    t--;
    if(t <= 0)
    {
      s = round(random(150, 225));
      sV = random(1, 7) * ((round(random(0, 1)) * -2) + 1);
      x = random(0, width);
      y = random(0, height);
      t = round(random(1, 15));
      c = color(random(0, 1) * 255, random(0, 1) * 255, random(0, 1) * 255);
    }
  }
}
