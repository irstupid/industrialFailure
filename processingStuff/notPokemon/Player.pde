class Player
{
  float speed = 3;
  float slowDown = 1;
  
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
    rect(x, y, TILEWIDTH, TILEHEIGHT);
  }
  
  void move()
  {
    x += xV * speed * slowDown;
    y += yV * speed * slowDown;
  }
  
  void setSlowDown(float slowDown)
  {
    this.slowDown = slowDown;
  }
  
  void collide(boolean[] tiles)
  {
    float tileX = x - x % TILEWIDTH;
    float tileY = y - y % TILEHEIGHT;
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
            y = TILEHEIGHT;
          }
          else
          {
            x = TILEWIDTH;
          }
        }
        else if(tiles[1])
        {
          if(TILEHEIGHT - y < x)
          {
            y = TILEHEIGHT;
          }
          else
          {
            x = 0;
          }
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
          if(TILEHEIGHT - y > x)
          {
            y = 0;
          }
          else
          {
            x = TILEWIDTH;
          }
        }
      break;
      case 2:
        if((tiles[0] && tiles[1]) || (tiles[2] && tiles[3]))
        {
          y = (tiles[0] ? TILEHEIGHT : 0);
        }
        else
        {
          x = (tiles[0] ? TILEWIDTH : 0);
        }
      break;
      case 3:
        if(!tiles[0])
        {
          x = 0;
          y = 0;
        }
        else if(!tiles[1])
        {
          x = TILEWIDTH;
          y = 0;
        }
        else if(!tiles[2])
        {
          x = TILEWIDTH;
          y = TILEHEIGHT; 
        }
        else
        {
          x = 0;
          y = TILEHEIGHT;
        }
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
