class Laser
{
  int speed = 25;
  
  int bounces;
  float[] x = new float[6];
  float[] y = new float[6];
  float r;
  
  int damage = 10;
  
  Laser(float x, float y, float r)
  {
    for(int i = 0; i < this.x.length; i++)
    {
      this.x[i] = x;
      this.y[i] = y;
    }
    
    this.r = r;
  }
  
  void draw()
  {
    //t++;
    
    for(int i = x.length - 1; i >= 1; i--)
    {
      x[i] = x[i - 1];
      y[i] = y[i - 1];
    }
    
    x[0] += cos(r) * speed;
    y[0] += sin(r) * speed;
    
    if(x[0] < 5)
    {
      x[0] = 5;
      r += radians(random(90, 135) * -(r/abs(r))); 
      bounces++;
      laserBounce.play();
    }
    if(x[0] > width - 5)
    {
      x[0] = width - 5;
      r += radians(random(90, 135) * (r/abs(r)));   
      bounces++;
      laserBounce.play();
    }
    if(y[0] < 5)
    {
      y[0] = 5;
      r += radians(random(90, 135) * (r/abs(r)));  
      bounces++;
      laserBounce.play();
    }
    if(y[0] > height - 5)
    {
      y[0] = height - 5;
      r += radians(random(90, 135) * -(r/abs(r)));   
      bounces++;
      laserBounce.play();
    }
    
    push();
      stroke(#ff0000);
      strokeWeight(5);
      for(int i = 0; i < this.x.length - 1; i++)
      {
        line(x[i], y[i], x[i + 1], y[i + 1]);
      }
    pop();
    
    if(bounces > 3)
    {
      die();
    }
  }
  
  void die()
  {
    boop.play();
    particles.add(new Particle(constrain(x[0], 0, width), constrain(y[0], 0, height), 2));
    gun.lasers.remove(this);
  }
}
