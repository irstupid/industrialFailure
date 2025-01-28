class Tomato
{
  float c1 = 0;
  float c2 = 0;
  PImage me;
  
  float x;
  float y;
  float xV;
  float yV;
  float hp = 100;
  
  float r;
  float rV = 0.3;
  float speed = 0.5;
  float s;
  
  float targetX;
  float targetY;
  
  Tomato(int c1, int c2, float x, float y)
  {
    this.c1 = hue(c1);
    this.c2 = hue(c2);
    me = tomato.copy();
    
    float cRatio = (this.c2 - this.c1)/85;
    for(int i = 0; i < me.pixels.length; i++)
    {
      if(me.pixels[i] != 0)
      {
        me.pixels[i] = color(this.c1 + (hue(me.pixels[i]) * cRatio), saturation(me.pixels[i]), brightness(me.pixels[i]));
      }
    }
    me.resize(0, 100);
    
    this.x = x;
    this.y = y;
  }
  
  void draw()
  {
    xV = -cos(atan2(y - targetY, x - targetX)) * speed;
    yV = -sin(atan2(y - targetY, x - targetX)) * speed;
    x += xV;
    y += yV;
    
    r += rV;
    s = 1 + (0.07 - abs(r)/100);
    if(r > 7 || r < -7)
    {
      rV = -rV;
    }
    //circle(x, y + 10, 100);
    push();
      translate(x, y);
      rotate(radians(r));
      translate(0, -me.height);
      scale(s);
      translate(0, me.height/2);
      image(me, -me.width/2, 0);
    pop();
    
    if(hp <= 0)
    {
      tomatos.remove(this);
      splats.add(new Splat(x, y, hue(me.pixels[10000])));
      score++;
      for(int i = 0; i < scoreColors.length; i++)
      {
        scoreColors[i] = color(random(0, 255), 255, 255);
      }
    }
  }
}
