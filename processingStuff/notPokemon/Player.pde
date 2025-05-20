class Player
{
  float speed = 3;
  float acceleration = 0.5;
  float slowDown = 1;
  
  float x;
  float y;
  float xV;
  float yV;
  int direction;
  
  boolean up;
  boolean down;
  boolean left;
  boolean right;
  
  Player(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  void draw()
  {
    push();
      rect(x, y, TILEWIDTH, TILEHEIGHT);
      fill(#00ff00);
      if(direction == 0)
      {
        circle(x - 20 + TILEWIDTH/2, y + TILEHEIGHT/2, 10);
      }
      else if(direction == 1)
      {
        circle(x + TILEWIDTH/2, y - 20 + TILEHEIGHT/2, 10);
      }
      else if(direction == 2)
      {
        circle(x + 20 + TILEWIDTH/2, y + TILEHEIGHT/2, 10);
      }
      else
      {
        circle(x + TILEWIDTH/2, y + 20 + TILEHEIGHT/2, 10);
      }
    pop();
  }
  
  void move()
  {
    xV += (left ? -acceleration : 0) + (right ? acceleration : 0);
    yV += (up ? -acceleration : 0) + (down ? acceleration : 0);
    if(left == right)
    {
      if(abs(xV) > acceleration)
      {
        xV -= acceleration * (xV/abs(xV));
      }
      else
      {
        xV = 0;
      }
    }
    if(up == down)
    {
      if(abs(yV) > acceleration)
      {
        yV -= acceleration * (yV/abs(yV));
      }
      else
      {
        yV = 0;
      }
    }
    xV = constrain(xV, -speed * slowDown, speed * slowDown);
    yV = constrain(yV, -speed * slowDown, speed * slowDown);
    
    x += xV;
    y += yV;
  }
  
  void direct()
  {
    if(!up && !down && !left && !right)
    {
      return;
    }
    
    if(abs(xV) < abs(yV))
    {
      if(yV > 0)
      {
        direction = 3;
      }
      else
      {
        direction = 1;
      }
    }
    else
    {
      if(xV > 0)
      {
        direction = 2;
      }
      else
      {
        direction = 0;
      }
    }
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
  float getDirection() { return direction; }
  int getTileX() { return round(x/TILEWIDTH); }
  int getTileY() { return round(y/TILEHEIGHT); }
  
  void keyPressed()
  {
    switch(key)
    {
      case 'w':
        up = true;
      break;
      case 'a':
        left = true;
      break;
      case 's':
        down = true;
      break;
      case 'd':
        right = true;
      break;
    }
  }
  
  void keyReleased()
  {
    switch(key)
    {
      case 'w':
        up = false;
      break;
      case 'a':
        left = false;
      break;
      case 's':
        down = false;
      break;
      case 'd':
        right = false;
      break;
    }
  }
}
