Level level;

void setup()
{
  //fullScreen();
  size(960, 540);
  level = new Level();
}

void draw()
{
  level.update();
  level.draw();
}

void keyPressed()
{
  level.keyPressed();
}
  
void keyReleased()
{
  level.keyReleased();
}
