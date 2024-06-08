class Particle
{
  float x;
  float y;
  float xV;
  float yV;
  
  int c;
  int type;
  
  Particle(float x, float y, int type)
  {
    this.x = x;
    this.y = y;
    this.type = type;
    switch(type)
    {
      case 1:
        c = #ff0000;
      break;
      case 2:
        c = #0000ff;
      break;
    }
  }
  
  void draw()
  {
    noStroke();
    fill(c);
    circle(x, y, 10);
  }
  
  void update()
  {
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
    
    x += xV;
    y += yV;
    
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
  }
  
  void act(ArrayList<Particle> particles)
  {
    for(int i = 0; i < particles.size(); i++)
    {
      Particle particle = particles.get(i);
      if(particle != this)
      {
        float d = 0.01/dist(x, y, particle.x, particle.y);
        xV += aversion[type - 1][particle.type - 1] * d * abs(x - particle.x);
        yV += aversion[type - 1][particle.type - 1] * d * abs(y - particle.y);
      }
    }
  }
}
