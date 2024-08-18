class Enemy
{
  float x;
  float y;
  float Rx;
  float Ry;
  int type;
  float speed;
  float scale = 1;
  int health = 5;
  int shrinkTime;
  
  PImage me;
  
  float SPEED;
  
  Enemy(float x, float y, int type)
  {
    this.x = x;
    this.y = y;
    this.type = type;
    
    me = enemyTypes[type];
  }
  
  void draw()
  {
    Rx += constrain(-cos(atan2(y - player.x, x - player.x)), -1, 1) * 0.8;
    Ry += constrain(-sin(atan2(y - player.y, x - player.y)), -1, 1) * 0.8;
    shrinkTime--;
    
    
    for(int i = 0; i < carrots.size(); i++)
    {
      if(distance(carrots.get(i).x, carrots.get(i).y) < 15)
      {
        if(scale < 1)
        {
          health--;
        }
        carrots.get(i).die();
      }
    }
    for(int i = 0; i < explosions.size(); i++)
    {
      if(distance(explosions.get(i).x, explosions.get(i).y) < 100)
      {
        shrinkTime = 300;
      }
    }
    
    if(shrinkTime > 0 && scale > 0.5)
    {
      scale -= 0.05;
    }
    else if(shrinkTime <= 0 && scale < 1)
    {
      scale += 0.05;
    }
    
    x = Rx + 400 * abs(1 - scale);
    y = Ry + 400 * abs(1 - scale);
    
    push();
      scale(scale);
      switch(type)
      {
        case 0:
          translate(-75, -105);
          break;
        case 1:
          translate(25, 0);
          break;
        case 2:
          translate(-40, -216);
          break;
        case 3:
          translate(-50, -102);
          break;
        case 4:
          translate(53, -107);
          break;
        case 5:
          translate(0, -30 * scale);
          break;
      }
      image(me, x - me.width/2, y - me.height/2);
    pop();
    //rect(x, y, 100, 100);
    
    if(health <= 0)
    {
      enemys.remove(this);
    }
  }
  
  float distance(float pX, float pY)
  {
    switch(type)
      {
        case 0:
          return min(boxDistance(pX, pY, x * scale, y * scale - 65 * scale, 100 * scale, 230 * scale), boxDistance(pX, pY, x * scale - 110 * scale, y * scale - 65 * scale + 125 * scale, 100 * scale, 230 * scale));
        case 1:
          return boxDistance(pX, pY, x * scale, y * scale, 200 * scale, 200 * scale);
        case 2:
          return min(boxDistance(pX, pY, x * scale, y * scale, 300 * scale, 100 * scale), boxDistance(pX, pY, x * scale + 110 * scale, y * scale - 110 * scale, 100 * scale, 100 * scale));
        case 3:
          return min(boxDistance(pX, pY, x * scale - 5 * scale, y * scale, 300 * scale, 100 * scale), boxDistance(pX, pY, x * scale - 110 * scale, y * scale - 110 * scale, 100 * scale, 100 * scale));
        case 4:
          //rect(x * scale, y * scale - 65 * scale, 100 * scale, 230 * scale);
          //rect(x * scale + 110 * scale, y * scale - 65 * scale + 110 * scale, 100 * scale, 200 * scale);
          return min(boxDistance(pX, pY, x * scale, y * scale - 65 * scale, 100 * scale, 230 * scale), boxDistance(pX, pY, x * scale + 110 * scale, y * scale - 65 * scale + 110 * scale, 100 * scale, 200 * scale));
        case 5:
          return boxDistance(pX, pY, x * scale, y * scale, 420 * scale, 100 * scale);
        default:
          return 1000f;
      }
  }
  
  PVector closePoint(float pX, float pY)
  {
    switch(type)
      {
        case 0:
          if(dist(x * scale, y * scale - 65 * scale, pX, pY) < dist(x * scale - 110 * scale, y * scale - 65 * scale + 125 * scale, pX, pY))
          {
            return new PVector(x * scale, y * scale - 65 * scale);
          }
          else
          {
            return new PVector(x * scale - 110 * scale, y * scale - 65 * scale + 125 * scale);
          }
        case 1:
          return new PVector(x * scale, y * scale);
        case 2:
          if(dist(x * scale, y * scale, pX, pY) < dist(x * scale + 110 * scale, y * scale - 110 * scale, pX, pY))
          {
            return new PVector(x * scale, y * scale);
          }
          else
          {
            return new PVector(x * scale + 110 * scale, y * scale - 110 * scale);
          }
        case 3:
          if(dist(x * scale - 5 * scale, y * scale, pX, pY) < dist(x * scale - 110 * scale, y * scale - 110 * scale, pX, pY))
          {
            return new PVector(x * scale - 5 * scale, y * scale);
          }
          else
          {
            return new PVector(x * scale - 110 * scale, y * scale - 110 * scale);
          }
        case 4:
          if(dist(x * scale, y * scale - 65 * scale, pX, pY) < dist(x * scale + 110 * scale, y * scale - 65 * scale + 110 * scale, pX, pY))
          {
            return new PVector(x * scale, y * scale - 65 * scale);
          }
          else
          {
            return new PVector(x * scale + 110 * scale, y * scale - 65 * scale + 110 * scale);
          }
        case 5:
        return new PVector(x * scale, y * scale);
        default:
          return new PVector(0, 0);
      }
  }
  
  float boxDistance(float pX, float pY, float bX, float bY, float w, float h)
  {
    pX = pX - bX;
    pY = pY - bY;
    return sqrt(sq(max(abs(pX) - w/2, 0)) + sq(max(abs(pY) - h/2, 0)));
  }
}
