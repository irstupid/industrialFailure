class Gun
{ 
  float x;
  float y;
  float r;
  
  int type;
  
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  ArrayList<Laser> lasers = new ArrayList<Laser>();
  
  Gun(float x, float y, int type)
  {
    this.x = x;
    this.y = y;
    this.type = type;
  }
  
  void draw()
  {
    r = atan2(mouseY - x, mouseX - y);
    
    for(int i = 0; i < bullets.size(); i++)
    {
      bullets.get(i).draw();
    }
    
    for(int i = 0; i < lasers.size(); i++)
    {
      lasers.get(i).draw();
    }
    
    if(type == 1)
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
    else
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
  }
  
  void shoot()
  {
    if(type == 1)
    {
      bullets.add(new Bullet(x + cos(r) * 60, y + sin(r) * 60, r));
      pew.play();
    }
    else
    {
      lasers.add(new Laser(x + cos(r) * 100, y + sin(r) * 100, r));
      zap.play();
    }
  }
}
