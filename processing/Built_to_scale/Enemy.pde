class Enemy
{
  float x;
  float y;
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
    if(gameState == 0)
    {
      if(scale == 1)
      {
        x += constrain(-cos(atan2(y - player.x, x - player.x)), -1, 1) * 0.8;
        y += constrain(-sin(atan2(y - player.y, x - player.y)), -1, 1) * 0.8;
      }
      else
      {
        x += constrain(-cos(atan2(y - player.x, x - player.x)), -1, 1) * 0.1;
        y += constrain(-sin(atan2(y - player.y, x - player.y)), -1, 1) * 0.1;
      }
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
          boom.play();
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
      if(health <= 0)
      {
        enemys.remove(this);
      }
    }
    
    push();
      imageMode(CENTER);
      translate(x, y);
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
      image(me, 0, 0);
    pop();
    //push();
    //  rectMode(CENTER);
    //  rect(x, y, 300 * scale, 100 * scale);
    //  rect(x + 110 * scale, y - 110 * scale, 100 * scale, 100 * scale);
    //  ellipse(x, y, 10, 10);
    //pop();
  }
  
  float distance(float pX, float pY)
  {
    switch(type)
      {
        case 0:
          return min(boxDistance(pX, pY, x, y - 65 * scale, 100 * scale, 230 * scale), boxDistance(pX, pY, x - 110 * scale, y + 60 * scale, 100 * scale, 230 * scale));
        case 1:
          return boxDistance(pX, pY, x, y, 200 * scale, 200 * scale);
        case 2:
          return min(boxDistance(pX, pY, x, y, 300 * scale, 100 * scale), boxDistance(pX, pY, x + 110 * scale, y - 110 * scale, 100 * scale, 100 * scale));
        case 3:
          return min(boxDistance(pX, pY, x - 5 * scale, y, 300 * scale, 100 * scale), boxDistance(pX, pY, x - 110 * scale, y - 110 * scale, 100 * scale, 100 * scale));
        case 4:
          return min(boxDistance(pX, pY, x, y - 65 * scale, 100 * scale, 230 * scale), boxDistance(pX, pY, x + 110 * scale, y + 45 * scale, 100 * scale, 200 * scale));
        case 5:
          return boxDistance(pX, pY, x, y, 420 * scale, 100 * scale);
        default:
          return 1000f;
      }
  }
  
  PVector closePoint(float pX, float pY)
  {
    switch(type)
      {
        case 0:
          if(dist(x, y - 65 * scale, pX, pY) < dist(x - 110 * scale, y - 65 * scale + 125 * scale, pX, pY))
          {
            return new PVector(x, y - 65 * scale);
          }
          else
          {
            return new PVector(x - 110 * scale, y - 65 * scale + 125 * scale);
          }
        case 1:
          return new PVector(x, y);
        case 2:
          if(dist(x, y, pX, pY) < dist(x + 110 * scale, y - 110 * scale, pX, pY))
          {
            return new PVector(x, y);
          }
          else
          {
            return new PVector(x + 110 * scale, y - 110 * scale);
          }
        case 3:
          if(dist(x - 5 * scale, y, pX, pY) < dist(x - 110 * scale, y - 110 * scale, pX, pY))
          {
            return new PVector(x - 5 * scale, y);
          }
          else
          {
            return new PVector(x - 110 * scale, y - 110 * scale);
          }
        case 4:
          if(dist(x, y - 65 * scale, pX, pY) < dist(x + 110 * scale, y - 65 * scale + 110 * scale, pX, pY))
          {
            return new PVector(x, y - 65 * scale);
          }
          else
          {
            return new PVector(x + 110 * scale, y - 65 * scale + 110 * scale);
          }
        case 5:
        return new PVector(x, y);
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
