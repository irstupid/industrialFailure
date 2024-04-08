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
    if(type == 2)
    {
      maxHealth = 75;
      speed = 1.25;
    }
    if(type == 3)
    {
      maxHealth = 100;
      speed = 1.5;
    }
    
    health = maxHealth;
  }
  
  void draw()
  {
    pPHealth = pHealth;
    pHealth = health;
    
    if(state == 0)
    {
      r = atan2(gun.y - y, gun.x - x);
      x += cos(r) * speed;
      y += sin(r) * speed;
    }
    
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
      pop();
    }
    else if(type == 2)
    {
      for(int i = 0; i < gun.bullets.size(); i++)
      {
        if(dist(gun.bullets.get(i).x, gun.bullets.get(i).y, x, y + 30) < 40 || dist(gun.bullets.get(i).x, gun.bullets.get(i).y, x, y - 25) < 35)
        {
          health -= gun.bullets.get(i).damage;
          gun.bullets.get(i).die();
        }
      }
      
      for(int i = 0; i < gun.lasers.size(); i++)
      {
        if((dist(gun.lasers.get(i).x[0], gun.lasers.get(i).y[0], x, y -25) < 25 || dist(gun.lasers.get(i).x[0], gun.lasers.get(i).y[0], x, y + 30) < 30) && pHealth == health && pPHealth == pHealth)
        {
          health -= gun.lasers.get(i).damage;
          gun.lasers.get(i).bounces--;          
        }
      }
      
      for(int i = 0; i < gun.missiles.size(); i++)
      {
        if(dist(gun.missiles.get(i).x, gun.missiles.get(i).y, x, y - 25) < 37.5 || dist(gun.missiles.get(i).x, gun.missiles.get(i).y, x, y + 30) < 42.5)
        {
          health -= gun.missiles.get(i).damage;
          gun.missiles.get(i).die();
        }
      }
      
      for(int i = 0; i < gun.fastBullets.size(); i++)
      {
        if(dist(gun.fastBullets.get(i).x, gun.fastBullets.get(i).y, x, y - 25) < 25 || dist(gun.fastBullets.get(i).x, gun.fastBullets.get(i).y, x, y + 30) < 30)
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
        ellipse(0, 25, 60, 60);
        
        ellipse(0, -25, 50, 50);
        fill(#000000);
        ellipse(12, -32, 7, 7);
        ellipse(-12, -32, 7, 7);
        push();
          rotate(radians(10));
          fill(#ff8800);
          ellipse(0, -25, 10, 10);
          triangle(0, -20, 0, -30, 20, -25);
        pop();
        ellipse(0, -8, 5, 5);
        ellipse(7, -11, 5, 5);
        ellipse(-7, -11, 5, 5);
        ellipse(13, -15, 5, 5);
        ellipse(-13, -15, 5, 5);
        
        fill(#00ff00);
        rect(maxHealth/2 - health/2, 70, health, 10);
        fill(#0066dd);
        rect(-health/2, 70, maxHealth - health, 10);
      pop();
    }
    else if(type == 2)
    {
      for(int i = 0; i < gun.bullets.size(); i++)
      {
        if(dist(gun.bullets.get(i).x, gun.bullets.get(i).y, x, y + 30) < 40 || dist(gun.bullets.get(i).x, gun.bullets.get(i).y, x, y - 25) < 35)
        {
          health -= gun.bullets.get(i).damage;
          gun.bullets.get(i).die();
        }
      }
      
      for(int i = 0; i < gun.lasers.size(); i++)
      {
        if((dist(gun.lasers.get(i).x[0], gun.lasers.get(i).y[0], x, y -25) < 25 || dist(gun.lasers.get(i).x[0], gun.lasers.get(i).y[0], x, y + 30) < 30) && pHealth == health && pPHealth == pHealth)
        {
          health -= gun.lasers.get(i).damage;
          gun.lasers.get(i).bounces--;          
        }
      }
      
      for(int i = 0; i < gun.missiles.size(); i++)
      {
        if(dist(gun.missiles.get(i).x, gun.missiles.get(i).y, x, y - 25) < 37.5 || dist(gun.missiles.get(i).x, gun.missiles.get(i).y, x, y + 30) < 42.5)
        {
          health -= gun.missiles.get(i).damage;
          gun.missiles.get(i).die();
        }
      }
      
      for(int i = 0; i < gun.fastBullets.size(); i++)
      {
        if(dist(gun.fastBullets.get(i).x, gun.fastBullets.get(i).y, x, y - 25) < 25 || dist(gun.fastBullets.get(i).x, gun.fastBullets.get(i).y, x, y + 30) < 30)
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
        ellipse(0, 25, 60, 60);
        
        ellipse(0, -25, 50, 50);
        fill(#000000);
        ellipse(12, -32, 7, 7);
        ellipse(-12, -32, 7, 7);
        push();
          rotate(radians(10));
          fill(#ff8800);
          ellipse(0, -25, 10, 10);
          triangle(0, -20, 0, -30, 20, -25);
        pop();
        ellipse(0, -8, 5, 5);
        ellipse(7, -11, 5, 5);
        ellipse(-7, -11, 5, 5);
        ellipse(13, -15, 5, 5);
        ellipse(-13, -15, 5, 5);
        
        fill(#00ff00);
        rect(maxHealth/2 - health/2, 70, health, 10);
        fill(#0066dd);
        rect(-health/2, 70, maxHealth - health, 10);
      pop();
    }
    else if(type == 3)
    {
      for(int i = 0; i < gun.bullets.size(); i++)
      {
        if(dist(gun.bullets.get(i).x, gun.bullets.get(i).y, x, y + 30) < 40 || dist(gun.bullets.get(i).x, gun.bullets.get(i).y, x, y - 25) < 35 || dist(gun.bullets.get(i).x, gun.bullets.get(i).y, x, y + 90) < 55)
        {
          health -= gun.bullets.get(i).damage;
          gun.bullets.get(i).die();
        }
      }
      
      for(int i = 0; i < gun.lasers.size(); i++)
      {
        if((dist(gun.lasers.get(i).x[0], gun.lasers.get(i).y[0], x, y -25) < 25 || dist(gun.lasers.get(i).x[0], gun.lasers.get(i).y[0], x, y + 30) < 30 || dist(gun.lasers.get(i).x[0], gun.lasers.get(i).y[0], x, y + 90) < 40) && pHealth == health && pPHealth == pHealth)
        {
          health -= gun.lasers.get(i).damage;
          gun.lasers.get(i).bounces--;          
        }
      }
      
      for(int i = 0; i < gun.missiles.size(); i++)
      {
        if(dist(gun.missiles.get(i).x, gun.missiles.get(i).y, x, y - 25) < 37.5 || dist(gun.missiles.get(i).x, gun.missiles.get(i).y, x, y + 30) < 42.5 || dist(gun.missiles.get(i).x, gun.missiles.get(i).y, x, y + 90) < 52.5)
        {
          health -= gun.missiles.get(i).damage;
          gun.missiles.get(i).die();
        }
      }
      
      for(int i = 0; i < gun.fastBullets.size(); i++)
      {
        if(dist(gun.fastBullets.get(i).x, gun.fastBullets.get(i).y, x, y - 25) < 25 || dist(gun.fastBullets.get(i).x, gun.fastBullets.get(i).y, x, y + 30) < 30 || dist(gun.fastBullets.get(i).x, gun.fastBullets.get(i).y, x, y + 90) < 40)
        {
          health -= gun.fastBullets.get(i).damage;
          gun.fastBullets.get(i).die();
        }
      }
      
      push();
        translate(x, y);
        strokeWeight(5);
        stroke(#A27942);
        line(15, 15, 45, 25);
        line(45, 25, 50, 20);
        line(45, 25, 50, 30);
        line(-15, 15, -45, 25);
        line(-45, 25, -50, 20);
        line(-45, 25, -50, 30);
        
        noStroke();
        fill(#ffffff);
        rectMode(CENTER);
        ellipse(0, 25, 60, 60);
        ellipse(0, 85, 80, 80);
        
        ellipse(0, -25, 50, 50);
        fill(#000000);
        ellipse(12, -32, 7, 7);
        ellipse(-12, -32, 7, 7);
        push();
          rotate(radians(10));
          fill(#ff8800);
          ellipse(0, -25, 10, 10);
          triangle(0, -20, 0, -30, 20, -25);
        pop();
        ellipse(0, -8, 5, 5);
        ellipse(7, -11, 5, 5);
        ellipse(-7, -11, 5, 5);
        ellipse(13, -15, 5, 5);
        ellipse(-13, -15, 5, 5);
        
        fill(#00ff00);
        rect(maxHealth/2 - health/2, 140, health, 10);
        fill(#0066dd);
        rect(-health/2, 140, maxHealth - health, 10);
      pop();
    }
    
    if(health <= 0)
    {
      snowMen.remove(this);
      if(type == 2)
      {
        snowMen.add(new SnowMan(1, x + random(-50, 50), y + random(-50, 50)));
        snowMen.add(new SnowMan(1, x + random(-50, 50), y + random(-50, 50)));
      }
      if(type == 3)
      {
        snowMen.add(new SnowMan(2, x + random(-50, 50), y + random(-50, 50)));
        snowMen.add(new SnowMan(1, x + random(-50, 50), y + random(-50, 50)));
      }
    }
    
    if(dist(x, y, gun.x, gun.y) < 50 && state == 0)
    {
      t = 0;
      
      gun.bullets = new ArrayList<Bullet>();
      gun.lasers = new ArrayList<Laser>();
      gun.missiles = new ArrayList<Missile>();
      gun.fastBullets = new ArrayList<FastBullet>();
      
      pew.stop();
      explosion.stop();
      zap.stop();
      laserBounce.stop();
      boop.stop();
      hiss.stop();
      bigBoom.stop();
      shot.stop();
      pop.stop();
      
      newExplodeTime = 0;
      newSoundTime = 0;
      
      state = 1;
      saveScore("null");
    }
  }
}
