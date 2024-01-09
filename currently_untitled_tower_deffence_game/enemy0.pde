class Enemy0
{
  PVector position = new PVector(0, 0);
  PVector direction = new PVector(0, 0);
  int nextPoint = 1;
  int ID;
  
  float SPEED = 4;
  
  Enemy0(PVector positionOld, int IDOld)
  {
    position = positionOld;
    ID = IDOld;
  }
  
  void draw()
  {
    if(path[nextPoint][0] > position.x)
    {
      position.x += SPEED;
      direction.x = 1;
    }
    else if(path[nextPoint][0] < position.x)
    {
      position.x -= SPEED;
      direction.x = -1;
    }
    if(path[nextPoint][1] > position.y)
    {
      position.y += SPEED;
      direction.y = 1;
    }
    else if(path[nextPoint][1] < position.y)
    {
      position.y -= SPEED;
      direction.y = -1;
    }
    
    if((((position.x >= path[nextPoint][0] && direction.x == 1) || (position.x <= path[nextPoint][0] && direction.x == -1)) || position.x == path[nextPoint][0]) && (((position.y >= path[nextPoint][1] && direction.y == 1) || (position.y <= path[nextPoint][1] && direction.y == -1)) || position.y == path[nextPoint][1]))
    {
      position = new PVector(path[nextPoint][0], path[nextPoint][1]);
      nextPoint += 1;
      if(nextPoint == path.length)
      {
        cry(ID);
      }
    }
      
    push();
      noStroke();
      fill(#ff0000);
      ellipse(position.x, position.y, 40, 40);
    pop();
  }
}
