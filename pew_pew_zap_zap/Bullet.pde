class Bullet
{
  float speed = 10;
  
  float x;
  float y;
  float direction;
  
  Bullet(float x, float y, float direction)
  {
    this.x = x;
    this.y = y;
    this.direction = direction;
  }
  
  void draw()
  {
    x += cos(direction) * speed;
    y += sin(direction) * speed;
    
    fill(#ffff00);
    ellipse(x, y, 20, 20);
    
    if(x > width + 5 || x < 0 - 5 || y > height + 5 || x < 0 - 5)
    {
      gun.bullets.remove(this);
    }
  }
}
