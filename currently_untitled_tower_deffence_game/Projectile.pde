class Projectile
{
  PVector position = null;
  float direction = 0;
  
  float SPEED = 10;
  
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
      ellipse(0, 0, 20, 20);
    pop();
    
    position.add((new PVector(cos(radians(direction)), sin(radians(direction))).normalize().mult(SPEED)));
  }
}
