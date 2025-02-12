class Bullet
{
  float speed = 10;
  
  float x;
  float y;
  float direction;
  
  int damage = 15;
  
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
    
    push();
      fill(#ffff00);
      ellipse(x, y, 20, 20);
    pop();
    
    if(x > width + 5 || x < 0 - 5 || y > height + 5 || y < 0 - 5)
    {
      die();
    }
  }
  
  void die()
  {
    explosion.play();
    particles.add(new Particle(constrain(x, 0, width), constrain(y, 0, height), 1));
    gun.bullets.remove(this);
  }
}
