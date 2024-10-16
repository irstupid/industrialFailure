class Splat
{
  float x;
  float y;
  float s = 1;
  float time;
  int type;
  PImage me;
  float c;
  boolean die = true;
  
  Splat(float x, float y, float c)
  {
    this.x = x;
    this.y = y;
    this.c = c;
    type = floor(random(0, 4));
    me = splat.copy();
    for(int i = 0; i < me.pixels.length; i++)
    {
      if(me.pixels[i] != 0)
      {
        me.pixels[i] = color(c, saturation(me.pixels[i]), brightness(me.pixels[i]));
      }
    }
  }
  
  Splat(float x, float y, float s, boolean die)
  {
    this.x = x;
    this.y = y;
    this.c = random(0, 255);
    this.s = s;
    this.die = die;
    type = floor(random(0, 4));
    me = splat.copy();
    me.resize(0, 400);
    for(int i = 0; i < me.pixels.length; i++)
    {
      if(me.pixels[i] != 0)
      {
        me.pixels[i] = color(c, saturation(me.pixels[i]), brightness(me.pixels[i]));
      }
    }
  }
  
  void draw()
  {
    if(die)
    {
      time++;
    }
    push();
    tint(#ffffff, 255 - max(time - 100, 0) * 2);
    translate(x - me.width/4 * s, y - me.width/4 * s);
    scale(s);
    switch(type)
    {
      case 0:
          image(me, 0, 0, me.width/2, me.height/2, 0, 0, me.width/2, me.height/2);
          break;
      case 1:
          image(me, -20, 20, me.width/2, me.height/2, me.width/2, 0, me.width, me.height/2);
          break;
      case 2:
          image(me, 0, 0, me.width/2, me.height/2, 0, me.height/2, me.width/2, me.height);
          break;
      case 3:
          image(me, -10, -10, me.width/2, me.height/2, me.width/2, me.height/2, me.width, me.height);
          break;
    }
    pop();
    if(255 - max(time - 100, 0) * 2 <= 0)
    {
      splats.remove(this);
    }
  }
}
