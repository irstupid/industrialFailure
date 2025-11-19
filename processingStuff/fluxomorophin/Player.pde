class Player
{
  private static final float GROUND_BOX_WIDTH = 100;
  private static final float GROUND_BOX_HEIGHT = 200;
  
  private static final float GRAVITY = 1;
  
  boolean debug = true;
  
  boolean left;
  boolean right;
  
  float x;
  float y;
  float xV;
  float yV;
  
  int accelerationTime;
  int decelerationTime;
  
  Box groundBox;
  
  Player(float x, float y)
  {
    groundBox = new Box(x, y, GROUND_BOX_WIDTH, GROUND_BOX_HEIGHT, Box.CENTER_WIDTH);
    this.x = x;
    this.y = y;
    xV = 0;
    yV = 0;
  }
  
  void draw()
  {
    if(debug)
    {
      groundBox.debugDraw();
    }
  }
  
  void update()
  {
    if(left ^ right)
    {
      decelerationTime = 0;
      xV = accelerationFunction(accelerationTime);
      accelerationTime++;
    }
    else
    {
      accelerationTime = 0;
      xV = decelerationFunction(decelerationTime);
      decelerationTime++;
    }
    
    yV += GRAVITY;
    
    x += xV;
    y += yV;
    
    groundBox.setX(x);
    groundBox.setY(y);
  }
  
  float accelerationFunction(float time)
  {
    return (left ? -10 : 10);
  }
  
  float decelerationFunction(float time)
  {
    return 0;
  }
  
  void keyPressed()
  {
    switch(key)
    {
      case 'a':
        left = true;
      return;
      case 'd':
        right = true;
      return;
    }
  }
  
  void keyReleased()
  {
    switch(key)
    {
      case 'a':
        left = false;
      return;
      case 'd':
        right = false;
      return;
    }
  }
}
