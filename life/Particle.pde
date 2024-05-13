class Particle
{
  float x;
  float y;
  float xV;
  float yV;
  
  int c;
  
  Particle(float x, float y, int c)
  {
    this.x = x;
    this.y = y;
    this.c = c;
  }
  
  void draw()
  {
    noStroke();
    fill(c);
    circle(x, y, 10);
  }
  
  void update()
  {
    if(x > width)
    {
      x = 0;
    }
    if(x < 0)
    {
      x = width;
    }
    if(y > height)
    {
      y = 0;
    }
    if(y < 0)
    {
      y = height;
    }
    
    if(xV > 0)
    {
      xV -= 0.1;
    }
    if(xV < 0)
    {
      xV += 0.1;
    }
    if(yV > 0)
    {
      yV -= 0.1;
    }
    if(yV < 0)
    {
      yV += 0.1;
    }
  }
  
  void selfReport()
  {
    boxes[(int)(floor(x/range) + floor(y/range) * (width/range))].add(this);
  }
}
