class Bullet
{
  float speed = 10;
  
  float x;
  float y;
  float direction;
  
  int damage = 10;
  
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
    
    if(x > width + 5 || x < 0 - 5 || y > height + 5 || y < 0 - 5)
    {
      explosion.play();
      particles.add(new Particle(constrain(x, 0, width), constrain(y, 0, height), 1));
      gun.bullets.remove(this);
    }
  }
}
