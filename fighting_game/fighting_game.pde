Fighter p1;

void setup()
{
  fullScreen();
  p1 = new Basic();
}

void draw()
{
  p1.draw();
}

void keyPressed()
{
  p1.keyPressed();
}
void keyReleased()
{
  p1.keyReleased();
}
