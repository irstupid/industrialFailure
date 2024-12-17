class Ball
{
  float x;
  float y;
  float r;
  float xV;
  float yV;
  
  Ball(float x, float y, float r, float xV, float yV)
  {
    this.x = x;
    this.y = y;
    this.r = r;
    this.xV = xV;
    this.yV = yV;
  }
  
  void modify()
  {
    x += xV;
    y += yV;
    
    if(x > width - r || x < r)
    {
      xV = -xV;
    }
    if(y > height - r || y < r)
    {
      yV = -yV;
    }
  }
  
  float f(float x, float y)
  {
    return (r * 100)/dist(x, y, this.x, this.y);
  }
}
