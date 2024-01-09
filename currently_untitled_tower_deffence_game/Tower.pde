class Tower
{
  PVector position = new PVector(0, 0);
  float angle = 0;
  PVector target = null;
  
  float RANGE = 200;
  
  Tower(PVector positionOld, float angleOld)
  {
    position = positionOld;
    angle = angleOld;
  }
  
  void draw()
  {
    target = null;
    var bestDistance = 0f;
    for(int i = 0; i < enemys.length; i++)
    {
      if(enemys[i] != null)
      {
        if(dist(enemys[i].position.x, enemys[i].position.y, position.x, position.y) <= RANGE/2)
        {
          if(enemys[i].distance > bestDistance)
          {
            target = enemys[i].position;
            bestDistance = enemys[i].distance;
          }
        }
      }
      if(target != null)
      {
        angle = -degrees(atan2(target.x - position.x, target.y - position.y)) + 180;
      }
    }
    
    push();
      noStroke();
      rectMode(CENTER);
      translate(position.x, position.y);
      rotate(radians(angle - 90));
      fill(#000000);
      ellipse(0, 0, 60, 60);
      rect(25, 0, 30, 15, 5);
      fill(#220000, 75);
      ellipse(0, 0, RANGE, RANGE);
    pop();
  }
}
