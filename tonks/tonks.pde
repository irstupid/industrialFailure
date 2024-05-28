Tank tank;
Wall[] walls;

void setup()
{
  size(800, 800, P2D);
  //fullScreen(P2D);
  tank = new Tank(width/2, height/2, 0);
  
  walls = new Wall[1];
  walls[0] = new Wall(100, 100, 100, 100);
}

void draw()
{
  background(90);
  tank.draw();
  walls[0].draw();
}

void keyPressed()
{
  tank.keyPressed();
}

void keyReleased()
{
  tank.keyReleased();
}
