class Leg
{
  float x; 
  float y; 
  float targetX; 
  float targetY;
  float longness;
  float atachmentX;
  float atachmentY;
  Leg(float atachmentX, float atachmentY, float longness, float targetX, float targetY)
  {
    this.atachmentX = atachmentX;
    this.atachmentY = atachmentY;
    this.longness = longness;
    this.targetX = targetX;
    this.targetY = targetY;
  }
  
  void draw()
  {
    if(dist(x, y, atachmentX + targetX, atachmentY + targetY) > longness)
    {
      x = atachmentX + targetX;
      y = atachmentY + targetY;
    }
    
    stroke(#ffffff);
    strokeWeight(20);
    line(atachmentX, atachmentY, x, y);
  }
}
