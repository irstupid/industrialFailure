class Ball
{
  PVector position = null;
  PVector velocity = null;
  PVector acceleration = null;
  
  float size;
  float mass;
  
  Ball(PVector position, PVector velocity, PVector acceleration, float size, float mass)
  {
    this.position = position;
    this.velocity = velocity;
    this.acceleration = acceleration;
    this.size = size;
    this.mass = mass;
  }
  
  Ball(float x, float y, float xV, float yV, float size, float mass)
  {
    this.position = new PVector(x, y);
    this.velocity = new PVector(xV, yV);
    this.acceleration = new PVector(0, 0);
    this.size = size;
    this.mass = mass;
  }
  
  void update()
  {
    velocity.add(acceleration);
    position.add(velocity);
    
    if(position.x < 0 + size/2 || position.x > width - size/2)
    {
      velocity.x = velocity.x * -1;
    }
    if(position.y < 0 + size/2 || position.y > height - size/2)
    {
      velocity.y = velocity.y * -1;
    }
  }
  
  void paint()
  {
    fill(#ff0000);
    noStroke();
    circle(position.x, position.y, size);
  }
}
