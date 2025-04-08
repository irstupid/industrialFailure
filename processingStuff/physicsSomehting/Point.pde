class Point
{
  PVector p;
  PVector pp;
  PVector g;
  
  Point(float x, float y)
  {
    p = new PVector(x, y);
    pp = new PVector(x, y);
    g = new PVector();
  }
  
  Point(float x, float y, float g)
  {
    p = new PVector(x, y);
    pp = new PVector(x, y);
    this.g = new PVector(0, g);
  }
  
  void draw()
  {
    push();
      noStroke();
      fill(#999999);
      circle(p.x, p.y, 10);
    pop();
  }
  
  void update()
  {
    p = p.copy().mult(2).sub(pp).add(g);
    p.x = constrain(p.x, 0, width);
    p.y = constrain(p.y, 0, height);
    pp = p.copy();
  }
  
  float getX() { return p.x; }
  float getY() { return p.y; }
  PVector getPosition() { return p; }
  void addPosition(PVector value) { p.add(value); }
  void setPosition(PVector value) { p = value; }
  void setPosition(float x, float y) { p.set(x, y); }
  PVector getGravity() { return g; }
  void setGravity(PVector value) { g = value; }
}
