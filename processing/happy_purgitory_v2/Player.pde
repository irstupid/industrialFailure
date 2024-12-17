class Player
{
  float x;
  float y;
  float xV;
  float yV;
  float s;
  
  int health = 3;
  
  Player(float x, float y, float s)
  {
    this.s = s;
    this.x = x;
    this.y = y;
  }
  
  void draw()
  {
    x += xV;
    y += yV;
    x = constrain(x, 25, width - 25);
    y = constrain(y, 25, height - 25);
    
    if(health == 3)
    {
      fill(#ffffff);
    }
    if(health == 2)
    {
      fill(#ffff00);
    }
    if(health == 1)
    {
      fill(#ff0000);
    }
    if(health < 1)
    {
      println("die");
      t = 0;
      state++;
    }
    ellipse(x, y, 50, 50);
  }
  
  void keyPressed()
  {
    if(key == 'd')
    {
      xV += s;
    }
    if(key == 'a')
    {
      xV -= s;
    }
    if(key == 'w')
    {
      yV -= s;
    }
    if(key == 's')
    {
      yV += s;
    }
  }
  
  void keyReleased()
  {
    if(key == 'd')
    {
      xV -= s;
    }
    if(key == 'a')
    {
      xV += s;
    }
    if(key == 'w')
    {
      yV += s;
    }
    if(key == 's')
    {
      yV -= s;
    }
  }
}
