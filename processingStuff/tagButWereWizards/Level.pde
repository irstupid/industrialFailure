class Level
{
  Box[] platforms;
  Player player;
  
  Level()
  {
    
  }
  
  void draw()
  {
    for(int i = 0; i > platforms.length; i++)
    {
      platforms[i].draw();
    }
  }
  
  void update()
  {
    player.update();
  }
}
