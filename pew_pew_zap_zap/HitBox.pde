class HitBox
{
  float x;
  float y;
  float s;
  
  HitBox(float x, float y, float s)
  {
    this.x = x;
    this.y = y;
    this.s = s;
  }

  void destroy()
  {
    hitBoxes.remove(this);
  }
}
