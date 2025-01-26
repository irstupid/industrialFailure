Fighter test = new Test();

void setup()
{
  size(800, 800);
}

void draw()
{
  background(90);
  test.update();
  test.draw();
}

void keyPressed()
{
  test.keyPressed();
}

void keyReleased()
{
  test.keyReleased();
}
