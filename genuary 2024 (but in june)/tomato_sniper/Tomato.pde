class Tomato
{
  float c1 = 0;
  float c2 = 0;
  PImage me;
  
  Tomato(int c1, int c2)
  {
    this.c1 = hue(c1);
    this.c2 = hue(c2);
    me = tomato;
    
    float cRatio = (this.c2 - this.c1)/85;
    for(int i = 0; i < me.pixels.length; i++)
    {
      if(me.pixels[i] != 0)
      {
        me.pixels[i] = color(this.c1 + (hue(me.pixels[i]) * cRatio), saturation(me.pixels[i]), brightness(me.pixels[i]));
      }
    }
  }
  
  void draw()
  {
    image(me, 0, 0);
  }
}
