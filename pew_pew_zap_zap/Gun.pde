class Gun
{
  float x;
  float y;
  float r;
  
  int type;
  
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  
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
        translate(x, y);
        rotate(r + radians(90));
        rectMode(CENTER);
        fill(200);
        rect(0, 0, 65, 65);
      pop();
    }
  }
  
  void shoot()
  {
    bullets.add(new Bullet(x + cos(r) * 60, y + sin(r) * 60, r, bullets.size()));
  }
}
