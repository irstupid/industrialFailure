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
          gun.bullets.get(i).die();
        }
      }
      
      for(int i = 0; i < gun.lasers.size(); i++)
      {
        if(dist(gun.lasers.get(i).x[0], gun.lasers.get(i).y[0], x, y) < 25)
        {
          health -= gun.lasers.get(i).damage;
          gun.lasers.get(i).die();
        }
      }
      
      for(int i = 0; i < gun.missiles.size(); i++)
      {
        if(dist(gun.missiles.get(i).x, gun.missiles.get(i).y, x, y) < 37.5)
        {
          health -= gun.missiles.get(i).damage;
          gun.missiles.get(i).die();
        }
      }
      
      for(int i = 0; i < gun.fastBullets.size(); i++)
      {
        if(dist(gun.fastBullets.get(i).x, gun.fastBullets.get(i).y, x, y) < 25)
        {
          health -= gun.fastBullets.get(i).damage;
          gun.fastBullets.get(i).die();
        }
      }
      
      push();
        translate(x, y);
        fill(#ffffff);
        rectMode(RIGHT);
        ellipse(0, 0, 50, 50);
        fill(#00ff00);
        rect(75, 35, 50 - health, 10);
      pop();
    }
    
    if(health <= 0)
    {
      snowMen.remove(this);
    }
  }
}
