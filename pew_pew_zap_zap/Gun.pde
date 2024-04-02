class Gun
{ 
  float x;
  float y;
  float r;
  
  int type;
  
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  ArrayList<Laser> lasers = new ArrayList<Laser>();
  ArrayList<Missile> missiles = new ArrayList<Missile>();
  ArrayList<FastBullet> fastBullets = new ArrayList<FastBullet>();
  
  
  
  int reloadTime;
  
  Gun(float x, float y, int type)
  {
    this.x = x;
    this.y = y;
    this.type = type;
  }
  
  void draw()
  {
    r = -atan2(mouseX - x, mouseY - y) + radians(90);
    
    for(int i = 0; i < bullets.size(); i++)
    {
      bullets.get(i).draw();
    }
    
    for(int i = 0; i < lasers.size(); i++)
    {
      lasers.get(i).draw();
    }
    
    for(int i = 0; i < missiles.size(); i++)
    {
      missiles.get(i).draw();
    }
    
    for(int i = 0; i < fastBullets.size(); i++)
    {
      fastBullets.get(i).draw();
    }
    
    if(type == 0)
    {
      push();
        translate(x, y);
        rotate(r + radians(90));
        rectMode(CENTER);
        fill(#151515);
        ellipse(0, 0, 75, 75);
        rect(0, -50, 25, 40);
      pop();
    }
    else if(type == 1)
    {
      push();
        noStroke();
        translate(x, y);
        rotate(r + radians(90));
        rectMode(CENTER);
        fill(200);
        rect(0, 0, 65, 65);
        stroke(200);
        strokeWeight(20);
        line(0, 0, 0, -105);
        stroke(#cd0000);
        strokeWeight(15);
        line(30, -50, -30, -50);
        line(20, -75, -20, -75);
        noStroke();
        fill(#cd0000);
        ellipse(0, -105, 30, 30);
      pop();
    }
    else if(type == 2)
    {
      push();
        noStroke();
        translate(x, y);
        rotate(r + radians(90));
        rectMode(CENTER);
        fill(175);
        ellipse(0, 0, 100, 100);
        fill(#aa0000);
        ellipse(-30, -100, 20, 20);
        ellipse(0, -100, 20, 20);
        ellipse(30, -100, 20, 20);
        fill(#ffff00);
        rect(0, -90, 100, 20, 10);
        fill(175);
        rect(0, -45, 100, 80);
      pop();
      
      reloadTime--;
    }
    else
    {
      if(mousePressed)
      {
        reloadTime--;
        if(reloadTime <= 0)
        {
          shot.play();
          for(int i = reloadTime; i < 1; i++)
          {
            fastBullets.add(new FastBullet(x + (cos(r) * 132) + (cos(r + radians(90)) * random(-30, 30)), y + (sin(r) * 132) + (sin(r + radians(90)) * random(-30, 30)), r));
            r += random(-0.05, 0.05);
          }
          reloadTime = 0;
        }
      }
      
      push();
        noStroke();
        translate(x, y);
        rotate(r + radians(90));
        scale(0.8, 0.8);
        rectMode(CENTER);
        fill(100);
        rect(0, -105, 20, 120);
        rect(25, -105, 20, 120);
        rect(-25, -105, 20, 120);
        fill(125);
        rect(0, 0, 90, 90);
        rect(0, -130, 90, 20);
      pop();
    }
  }
  
  void shoot()
  {
    if(type == 0)
    {
      bullets.add(new Bullet(x + cos(r) * 60, y + sin(r) * 60, r));
      pew.play();
    }
    else if(type == 1)
    {
      lasers.add(new Laser(x + cos(r) * 100, y + sin(r) * 100, r));
      zap.play();
    }
    else if(type == 2 && reloadTime <= 0)
    {
      reloadTime = 10;
      missiles.add(new Missile(x + cos(r) * 110, y + sin(r) * 110, r));
    }
    else
    {
      reloadTime = 2;
    }
  }
}
