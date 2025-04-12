final float TILEWIDTH = 50;
final float TILEHEIGHT = 50;

World world;

void setup()
{
  size(800, 800);
  
  world = new World();
}

void draw()
{
  world.draw();
}

void keyPressed()
{
  world.keyPressed();
}

void keyReleased()
{
  world.keyReleased();
}
