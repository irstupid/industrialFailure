class Berry
{
  PVector position;
  PVector velocity = new PVector(0, 0);
  float direction;
  float rotation;
  float scale;
  int type;
  
  float gravity = 0.15;
  float terminalVelocity = 15;
  
  Berry(PVector sPosition, float sDirection, int sType, float sRotation, float sScale)
  {
    position = sPosition;
    direction = sDirection;
    velocity = new PVector(cos(direction), sin(direction)).mult(7);
    rotation = sRotation;
    type = sType;
    scale = sScale;
  }
  
  void draw()
  {
    rotation += 10;
    
    if(velocity.y < terminalVelocity)
    {
      velocity.y += gravity;
    }
    position.add(velocity);
    
    berry(position.x, position.y, rotation, scale, type);
    
    if(position.x > width || position.x < 0 || position.y > height || position.y < 0)
    {
      berrys.remove(this);
    }
  }
}
