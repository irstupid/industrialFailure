final float TILEWIDTH = 50;
final float TILEHEIGHT = 50;

World world;
Battle battle;

void setup()
{
  //fullScreen(P2D);
  size(960, 540, P2D);
  
  world = new World();
  battle = new Battle();
}

void draw()
{
  world.update();
  world.draw();
  //battle.draw();
}

void keyPressed()
{
  world.keyPressed();
  //battle.keyPressed();
}

void keyReleased()
{
  world.keyReleased();
}
