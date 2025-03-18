class Player
{
  float speed = 3;
  
  float x;
  float y;
  float xV;
  float yV;
  
  Player(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  void draw()
  {
    x += xV * speed;
    y += yV * speed;
    
    rect(x, y, tileWidth, tileHeight);
  }
  
  void collide(boolean[] tiles)
  {
    float csX = ((x - tileWidth/2) - ((x - tileWidth/2) - (x - tileWidth/2) % (tileWidth * 2)));
    float csY = ((y - tileHeight/2) - ((y - tileHeight/2) - (y - tileHeight/2) % (tileHeight * 2)));
    int walls = 0;
    for(int i = 0; i < tiles.length; i++)
    {
      walls += (tiles[i] ? 1 : 0);
    }
    //switch(walls)
    //{
    //  case 1:
    //    boolean horizontal;
    //    horizontal = abs(y) > abs(x);
    //  break;
    //  case 2:
      
    //  break;
    //  case 3:
      
    //  break;
    //}
  }
  
  float getX() { return x; }
  float getY() { return y; }
  
  void keyPressed()
  {
    switch(key)
    {
      case 'w':
        yV = -1;
      break;
      case 'a':
        xV = -1;
      break;
      case 's':
        yV = 1;
      break;
      case 'd':
        xV = 1;
      break;
    }
  }
  
  void keyReleased()
  {
    switch(key)
    {
      case 'w': case 's':
        yV = 0;
      break;
      case 'a': case 'd':
        xV = 0;
      break;
    }
  }
}
