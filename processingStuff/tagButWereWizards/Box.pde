class Box
{
  float x, y;
  float w, h;
  
  Box(float x, float y, float w, float h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void draw()
  {
    push();
      rectMode(CENTER);
      rect(x, y, w, h);
    pop();
  }
  
  float getX() { return x; }
  float getY() { return y; }
  float getW() { return w; }
  float getH() { return h; }
  
  float distance(float x, float y)
  {
    x = x - this.x;
    y = y - this.y;
    float dX = abs(x) - w/2;
    float dY = abs(y) - h/2;
    float p1 = sqrt(sq(max(dX, 0f)) + sq(max(dY, 0f)));
    float p2 = max(dX, dY);
    return p1 + min(p2, 0f);
  }
}
