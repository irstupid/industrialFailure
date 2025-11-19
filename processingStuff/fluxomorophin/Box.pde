//i just had a little fun writing this like a standard java class

class Box
{
  //fine, ill make enums my self
  public final static int CORNER_WIDTH = 0;
  public final static int CORNER_CORNER = 1;
  public final static int CENTER_WIDTH = 2;
  
  float x;
  float y;
  float w;
  float h;
  int style;
  
  Box(float x, float y, float w, float h, int style)
  {
    this.style = style;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  Box(float x, float y, float w, float h)
  {
    this(x, y, w, h, 0);
  }
  
  public void debugDraw()
  {
    push();
      switch(style)
      {
        case CORNER_WIDTH:
          rectMode(CORNER);
        break;
        case CORNER_CORNER:
          rectMode(CORNERS);
        break;
        case CENTER_WIDTH:
          rectMode(CENTER);
        break;
      }
      fill(#ff0000);
      rect(x, y, w, h);
    pop();
  }
  
  public boolean colliding(Box box)
  {
    return distance(box) <= 0;
  }
  
  public float distance(Box box)
  {
    return 0; //TODO make this actually work
  }
  
  public float getX() { return x; }
  public float getY() { return y; }
  public float getW() { return w; }
  public float getH() { return h; }
  public int getStyle() { return style; }
  
  public void setX(float value) {x = value;}
  public void setY(float value) {y = value;}
  public void setW(float value) {w = value;}
  public void setH(float value) {h = value;}
}
