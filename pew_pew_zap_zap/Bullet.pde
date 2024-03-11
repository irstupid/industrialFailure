class Bullet
{
  float x;
  float y;
  float direction;
  float speed = 10;
  
  int ID;
  
  Bullet(float x, float y, float direction, int ID)
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
    ellipse(x, y, 10, 10);
    
    if(x > width + 5 || x < 0 - 5 || y > height + 5 || x < 0 - 5)
    {
      gun.bullets.remove(ID);
    }
  }
}
