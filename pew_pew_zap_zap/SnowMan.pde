class SnowMan
{
  int type;
  float x;
  float y;
  float r;
  
  float speed;
  int health;
  
  SnowMan(int type, float x, float y)
  {
    this.x = x;
    this.y = y;
    this.type = type;
    
    if(type == 1)
    {
      health = 50;
      speed = 1;
    }
  }
  
  void draw()
  {
    r = atan2(gun.x - y, gun.y - x);
    x += cos(r) * speed;
    y += sin(r) * speed;
    
    if(type == 1)
    {
      for(int i = 0; i < gun.bullets.size(); i++)
      {
        if(dist(gun.bullets.get(i).x, gun.bullets.get(i).y, x, y) < 35)
        {
          health -= gun.bullets.get(i).damage;
          explosion.play();
          particles.add(new Particle(constrain(gun.bullets.get(i).x, 0, width), constrain(gun.bullets.get(i).y, 0, height), 1));
          gun.bullets.remove(i);
        }
      }
      
      fill(#ffffff);
      ellipse(x, y, 50, 50);
    }
    
    if(health <= 0)
    {
      snowMen.remove(this);
    }
  }
}
