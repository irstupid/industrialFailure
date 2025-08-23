World world;

void setup()
{
  size(800, 800);
  world = new World();
}

void draw()
{
  background(#eeeeee);
  world.draw();
}
