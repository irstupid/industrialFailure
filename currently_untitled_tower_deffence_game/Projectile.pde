class Projectile
{
  PVector position = new PVector(0, 0);
  float direction = 0;
  
  float SPEED = 20;
  
  Projectile(PVector positionOld, float directionOld)
  {
    position = positionOld;
    direction = directionOld;
  }
  
  void draw()
  {
    push();
      noStroke();
      fill(#ffff00);
      translate(position.x, position.y);
      ellipse(0, 0, 10, 10);
    pop();
    
    position.add((new PVector(cos(radians(direction)), sin(radians(direction))).normalize().mult(SPEED)));
  }
}
