class SnowMan
{
  int type;
  float x;
  float y;
  float r;
  
  float speed;
  int health;
  int maxHealth;
  
  int pHealth;
  int pPHealth;
  
  SnowMan(int type, float x, float y)
  {
    this.x = x;
    this.y = y;
    this.type = type;
    
    if(type == 1)
    {
      maxHealth = 50;
      speed = 1;
    }
    
    health = maxHealth;
  }
  
  void draw()
  {
    pPHealth = pHealth;
    pHealth = health;
    
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
        if(dist(gun.lasers.get(i).x[0], gun.lasers.get(i).y[0], x, y) < 25 && pHealth == health && pPHealth == pHealth)
        {
          health -= gun.lasers.get(i).damage;
          gun.lasers.get(i).bounces--;          
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
        noStroke();
        translate(x, y);
        fill(#ffffff);
        rectMode(CENTER);
        ellipse(0, 0, 50, 50);
        fill(#000000);
        ellipse(12, -7, 7, 7);
        ellipse(-12, -7, 7, 7);
        push();
          rotate(radians(10));
          fill(#ff8800);
          ellipse(0, 0, 10, 10);
          triangle(0, 5, 0, -5, 20, 0);
        pop();
        ellipse(0, 17, 5, 5);
        ellipse(7, 14, 5, 5);
        ellipse(-7, 14, 5, 5);
        ellipse(13, 10, 5, 5);
        ellipse(-13, 10, 5, 5);
        
        fill(#00ff00);
        rect(maxHealth/2 - health/2, 40, health, 10);
        fill(#0066dd);
        rect(-health/2, 40, maxHealth - health, 10);
        println(health);
      pop();
    }
    
    if(health <= 0)
    {
      snowMen.remove(this);
    }
  }
}
