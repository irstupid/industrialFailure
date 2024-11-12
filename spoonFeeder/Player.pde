class Player
{
  String name;
  float x;
  float y;
  int c;
  
  private float xV;
  private float yV;
  
  Player(String name)
  {
    this.name = name;
    x = random(0, 800);
    y = random(0, 800);
    colorMode(HSB);
    c = color(random(0, 255), 255, 255);
    colorMode(RGB);
  }
  
  void draw()
  {    
    x += xV * 4;
    y += yV * 4;
  }
  
  void keyPressed(char key)
  {
    switch(key)
    {
      case 'w':
        yV += -1;
        break;
      case 'a':
        xV += -1;
        break;
      case 's':
        yV += 1;
        break;
      case 'd':
        xV += 1;
        break;
    }
  }
  
  void keyReleased(char key)
  {
    switch(key)
    {
      case 'w':
        yV += 1;
        break;
      case 'a':
        xV += 1;
        break;
      case 's':
        yV += -1;
        break;
      case 'd':
        xV += -1;
        break;
    }
  }
}
