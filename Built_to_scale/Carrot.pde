class Carrot
{
  float x;
  float y;
  float r;
  PImage me;
  int unHit = 20;
  
  Carrot(float x, float y, float r)
  {
    this.x = x;
    this.y = y;
    this.r = r;
    me = carrot;
  }
  
  void draw()
  {
    unHit--;
    x += cos(r) * 5;
    y += sin(r) * 5;
    push();
        translate(x, y);
        rotate(r + radians(90));
        translate(-408, -365);
        image(carrot, 0, 0);
    pop();
    //circle(x, y, 30);
  }
  
  void die()
  {
    carrots.remove(this);
  }
}
