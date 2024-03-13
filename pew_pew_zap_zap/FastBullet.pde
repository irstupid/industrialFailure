class FastBullet
{
  float x;
  float y;
  float r;
  
  float speed = 20;
  
  FastBullet(float x, float y, float r)
  {
    this.x = x;
    this.y = y;
    this.r = r + radians(random(-30, 30));
  }
  
  void draw()
  {
    x += cos(r) * speed;
    y += sin(r) * speed;
    
    push();
      stroke(#ffffff);
      strokeWeight(2);
      line(x, y, x - cos(r) * 10, y - sin(r) * 10);
    pop();
    
    if(x > width + 5 || x < 0 - 5 || y > height + 5 || y < 0 - 5)
    {
      gun.fastBullets.remove(this);
    }
    
  }
}
