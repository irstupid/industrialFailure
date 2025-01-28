class Bullet
{
  float x;
  float y;
  float xV;
  float yV;
  
  Bullet(float x, float y, float xV, float yV)
  {
    this.x = x;
    this.y = y;
    this.xV = xV;
    this.yV = yV;
  }
  
  void draw()
  {
    x += xV;
    y += yV;
    
    push();
      noStroke();
      fill(#F5E20F);
      circle(x, y, width/100);
    pop();
  }
  
  void collideX()
  {
    xV = xV * -1;
  }
  
  void collideY()
  {
    yV = yV * -1;
  }
}
