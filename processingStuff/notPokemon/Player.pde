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
    float tileX = x - x % tileWidth;
    float tileY = y - y % tileHeight;
    x = x - tileX;
    y = y - tileY;
    
    int walls = 0;
    for(int i = 0; i < tiles.length; i++)
    {
      walls += (tiles[i] ? 1 : 0);
    }
    
    switch(walls)
    {
      case 1:
        if(tiles[0])
        {
          if(x < y)
          {
            y = tileHeight;
          }
          else
          {
            x = tileWidth;
          }
        }
        else if(tiles[1])
        {
          
        }
        else if(tiles[2])
        {
          if(x > y)
          {
            y = 0;
          }
          else
          {
            x = 0;
          }
        }
        else
        {
          
        }
      break;
      case 2:
        if((tiles[0] && tiles[1]) || (tiles[2] && tiles[3]))
        {
          y = (tiles[0] ? tileHeight : 0);
        }
        else
        {
          x = (tiles[0] ? tileWidth : 0);
        }
      break;
      case 3:
      
      break;
    }
    x = x + tileX;
    y = y + tileY;
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
