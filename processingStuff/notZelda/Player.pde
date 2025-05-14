class Player
{
  final float[][][] SWORDHIT = 
  {
    {},
    {{TILEWIDTH/2 + TILEWIDTH/8, 0, TILEWIDTH/4}, {TILEWIDTH/2 + (TILEWIDTH/8) * 2, TILEHEIGHT/4, TILEWIDTH/4}, {TILEWIDTH/2 + (TILEWIDTH/8) * 4, TILEHEIGHT/2, TILEWIDTH/4}},
    {{TILEWIDTH/2 + TILEWIDTH/8, 0, TILEWIDTH/4}, {TILEWIDTH/2 + (TILEWIDTH/8) * 3, TILEHEIGHT/8, TILEWIDTH/4}, {TILEWIDTH/2 + (TILEWIDTH/8) * 6, TILEHEIGHT/4, TILEWIDTH/4}},
    {{TILEWIDTH/2 + TILEWIDTH/8, 0, TILEWIDTH/4}, {TILEWIDTH/2 + (TILEWIDTH/8) * 3, 0, TILEWIDTH/4}, {TILEWIDTH/2 + (TILEWIDTH/8) * 6, 0, TILEWIDTH/4}},
    {{TILEWIDTH/2 + TILEWIDTH/8, 0, TILEWIDTH/4}, {TILEWIDTH/2 + (TILEWIDTH/8) * 3, -TILEHEIGHT/8, TILEWIDTH/4}, {TILEWIDTH/2 + (TILEWIDTH/8) * 6, -TILEHEIGHT/4, TILEWIDTH/4}},
    {{TILEWIDTH/2 + TILEWIDTH/8, 0, TILEWIDTH/4}, {TILEWIDTH/2 + (TILEWIDTH/8) * 2, -TILEHEIGHT/4, TILEWIDTH/4}, {TILEWIDTH/2 + (TILEWIDTH/8) * 4, -TILEHEIGHT/2, TILEWIDTH/4}},
    {}
  };
  
  float speed = 3;
  float slowDown = 1;
  
  float x;
  float y;
  float xV;
  float yV;
  
  int swing;
  float[][] sword;
  
  Player(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  void draw()
  {
    rect(x, y, TILEWIDTH, TILEHEIGHT);
    
    if(swing > 0)
    {
      swing--;
    }
    
    push();
      fill(#ff0000, 200);
      for(int i = 0; i < sword.length; i++)
      {
        circle(sword[i][0], sword[i][1], sword[i][2]);
      }
    pop();
  }
  
  void sword()
  {
    float[][] swordHit = SWORDHIT[ceil(swing/2)];
    sword = new float[swordHit.length][3];
    for(int i = 0; i < swordHit.length; i++)
    { 
      sword[i][0] += x + TILEWIDTH/2;
      sword[i][1] += y + TILEHEIGHT/2;
      sword[i][0] += swordHit[i][(abs(yV) > abs(xV) ? 1 : 0)] * ((abs(yV) > abs(xV) ? yV : xV) >= 0 ? 1 : -1);
      sword[i][1] += swordHit[i][(abs(yV) > abs(xV) ? 0 : 1)] * ((abs(yV) > abs(xV) ? yV : xV) >= 0 ? 1 : -1);
      
      sword[i][2] = swordHit[i][2];
    }
  }
  
  void move()
  {
    if(swing == 0)
    {
      x += xV * speed * slowDown;
      y += yV * speed * slowDown;
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
  
  void keyPressed()
  {
    switch(key)
    {
      case '1':
        if(swing <= 4)
        {
          swing = 12;
        }
      break;
      case 'w':
        if(swing == 0)
        {
          yV = -1;
        }
      break;
      case 'a':
        if(swing == 0)
        {
          xV = -1;
        }
      break;
      case 's':
        if(swing == 0)
        {
          yV = 1;
        }
      break;
      case 'd':
        if(swing == 0)
        {
          xV = 1;
        }
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
