class Box
{
  float x;
  float y;
  float w;
  float h;
  
  Box(float x, float y, float w, float h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  float f(float x, float y)
  {
    float dx = max(abs(x - this.x) - w / 2, 0);
    float dy = max(abs(y - this.y) - h / 2, 0);
    return 1000000/(dx * dx + dy * dy);
  }
}
