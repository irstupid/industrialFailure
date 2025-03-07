class Map
{
  Tile[] map;
  float boundsLeft, boundsRight, boundsUp, boundsDown;
  int viewWidth, viewHeight;
  
  Map(Tile[] map)//float boundsLeft, float boundsRight, float boundsUp, float boundsDown)
  {
    this.boundsLeft = boundsLeft;
    this.boundsRight = boundsRight;
    this.boundsUp = boundsUp;
    this.boundsDown = boundsDown;
    this.map = map;
    
    viewWidth = ceil(width/50f);
    viewHeight = ceil(height/50f);
  }
  
  void draw(float xPosition, float yPosition)
  {
    push();
      for(int y = 0; y < viewHeight; y++)
      {
        for(int x = 0; x < viewWidth; x++)
        {
          rect(x * 50, y * 50, 50, 50);
        }
      }
    pop();
  }
}
