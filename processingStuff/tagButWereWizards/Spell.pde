abstract class Spell
{
  int SIZE;
  int DAMAGE;
  
  float x, y;
  float xV, yV;
  boolean dead;
  
  void draw()
  {
    
  }
  
  void move()
  {
    x += xV;
    y += yV;
  }
  
  void collide(float distance)
  {
    
  }
  
  float getX() { return x; }
  float getY() { return y; }
  boolean isDead() { return dead; }
}
