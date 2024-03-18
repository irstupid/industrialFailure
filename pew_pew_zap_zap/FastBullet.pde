class FastBullet
{
  float x;
  float y;
  float r;
  
  float speed = 20;
  float damage = 1;
  
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
      strokeWeight(3.5);
      line(x, y, x - cos(r) * 20, y - sin(r) * 20);
    pop();
    
    if(x > width + 5 || x < 0 - 5 || y > height + 5 || y < 0 - 5)
    {
      die();
    }
  }
  
  void die()
  {
    pop.play();
    particles.add(new Particle(constrain(x, 0, width), constrain(y, 0, height), 5));
    gun.fastBullets.remove(this);
  }
}
