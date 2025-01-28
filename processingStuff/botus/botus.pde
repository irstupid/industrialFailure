Fighter test = new Test();
Stage stage = new Simple();

void setup()
{
  size(800, 800);
}

void draw()
{
  background(90);
  test.update();
  test.grounded = stage.onGround(test.x, test.y, test.WIDTH, test.HEIGHT);
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
