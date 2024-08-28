class Fighter
{
  float x;
  float y;
  int directionX;
  int directionY;
  String animation;
  
  Fighter()
  {
    
  }
  
  void draw(){ }
  void light(){ }
  void medium(){ }
  void heavy(){ }
  
  void keyPressed()
  {
    switch(key)
    {
      case 'w':
        directionY -= 1;
        break;
      case 'a':
        directionX -= 1;
        break;
      case 's':
        directionY += 1;
        break;
      case 'd':
        directionX += 1;
        break;
      case '1':
        light();
        break;
      case '2':
        medium();
        break;
      case '3':
        heavy();
        break;
    }
  }
  
  void keyReleased()
  {
    switch(key)
    {
      case 'w':
        directionY += 1;
        break;
      case 'a':
        directionX += 1;
        break;
      case 's':
        directionY -= 1;
        break;
      case 'd':
        directionX -= 1;
        break;
    }
  }
  
}
