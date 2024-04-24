class Spoder
{
  float x;
  float y;
  float xV;
  float yV;
  Leg[] legs;
  Spoder(float x, float y, Leg[] legs)
  {
    this.x = x;
    this.y = y;
    this.legs = legs;
    
    for(int i = 0; i < legs.length; i++)
    {
      legs[i].draw();
    }
  }
  
  void draw()
  {
    for(int i = 0; i < legs.length; i++)
    {
      legs[i].draw();
    }
  }
}
