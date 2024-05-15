Tank tank;

void setup()
{
  size(800, 800);
  //fullScreen();
  tank = new Tank(width/2, height/2, 0);
}

void draw()
{
  background(90);
  tank.draw();
}

void keyPressed()
{
  tank.keyPressed();
}

void keyReleased()
{
  tank.keyReleased();
}
