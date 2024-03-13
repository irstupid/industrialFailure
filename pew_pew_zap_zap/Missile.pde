class Missile
{
  float x;
  float y;
  float r;
  float rV;
  float speed = 7;
  
  int hissTime;
  
  Particle trail;
  
  Missile(float x, float y, float r)
  {
    this.x = x;
    this.y = y;
    this.r = r;
    
    trail = new Particle(x, y, 3);
  }
  
  void draw()
  {
    hissTime--;
    
    if(hissTime <= 0)
    {
      hiss.play();
      hissTime = 60;
    }
    
    rV += random(-0.01, 0.01);
    rV = constrain(rV, -0.1, 0.1);
    r += rV;
    
    x += cos(r) * speed;
    y += sin(r) * speed;
    
    
    trail.x = x + cos(r) * -25;
    trail.y = y + sin(r) * -25;
    trail.draw();
    
    push();
      translate(x, y);
      rotate(r + radians(90));
      rectMode(CENTER);
      noStroke();
      fill(200);
      rect(0, 0, 25, 50);
      fill(#aa0000);
      triangle(-12.5, -25, 12.5, -25, 0, -60);
    pop();
    
    if(x > width + 5 || x < 0 - 5 || y > height + 5 || y < 0 - 5)
    {
      particles.add(new Particle(constrain(x, 0, width), constrain(y, 0, height), 4));
      hiss.stop();
      bigBoom.play();
      gun.missiles.remove(this);
    }
  }
}
