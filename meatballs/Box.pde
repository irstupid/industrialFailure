class Box
{
  float x;
  float y;
  float w;
  float h;
  float xV;
  float yV;
  
  Box(float x, float y, float w, float h, float xV, float yV)
  {
    this.x = x;
    this.y = y;
  }
  
  void modify()
  {
    
  }
  
  float f(float x, float y)
  {
    float dx = max(abs(x - this.x) - w / 2, 0);
    float dy = max(abs(y - this.y) - h / 2, 0);
    return 100/(dx * dx + dy * dy);
  }
}
