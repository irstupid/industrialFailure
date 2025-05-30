class Blast extends Spell
{
  float SPEED = 8;
  float SIZE = 10;
  
  Blast(float x, float y, float xD, float yD)
  {
    this.x =x;
    this.y = y;
    xV = xD * SPEED;
    yV = yD * SPEED;
  }
  
  void draw()
  {
    push();
      fill(#ff44cc);
      circle(x, y, SIZE);
    pop();
  }
  
  void collide(float distance)
  {
    if(distance <= SIZE/2)
    {
      dead = true;
    }
  }
}
