class Projectile
{
  PVector position = new PVector(0, 0);
  float direction = 0;
  int ID;
  
  float SPEED = 20;
  
  Projectile(PVector positionOld, float directionOld, int IDOld)
  {
    position = positionOld;
    direction = directionOld;
    ID = IDOld;
  }
  
  void draw()
  {
    push();
      noStroke();
      fill(#ffff00);
      translate(position.x, position.y);
      ellipse(0, 0, 10, 10);
    pop();
    
    position.add((new PVector(cos(radians(direction)), sin(radians(direction))).normalize().mult(SPEED)));
    
    for(int i = 0; i < enemys.length; i++)
    {
      if(enemys[i] != null)
      {
        if(dist(enemys[i].position.x, enemys[i].position.y, position.x, position.y) < 25)
        {
          enemys[i] = null;
          enemysAlive--;
          freeProjectiles.append(ID);
          projectiles[ID] = null;
        }
      }
    }
  }
}
