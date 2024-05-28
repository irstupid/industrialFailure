class Wall
{
  float x;
  float y;
  float w;
  float h;
  
  Wall(float x, float y, float w, float h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void draw()
  {
    push();
      noStroke();
      fill(#44444f);
      rect(x, y, w, h);
    pop();
  }
}
