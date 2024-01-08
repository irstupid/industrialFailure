class Berry
{
  PVector position;
  PVector velocity = new PVector(0, 0);
  float direction;
  float rotation;
  float scale;
  int type;
  
  float gravity = 0.075;
  
  Berry(PVector sPosition, float sDirection, int sType, float sRotation, float sScale)
  {
    position = sPosition;
    direction = sDirection;
    rotation = sRotation;
    type = sType;
    scale = sScale;
  }
  
  void draw()
  {
    velocity.y += gravity;
    position.add(velocity);
    
    berry(position.x, position.y, 0, scale, type);
  }
}
