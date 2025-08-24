World world;

void setup()
{
  size(500, 500);
  world = new World();
}

void draw()
{
  background(#eeeeee);
  world.draw();
}
