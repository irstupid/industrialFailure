World world;
UI ui;

int weight = 2;

void setup()
{
  size(500, 500);
  world = new World();
  ui = new UI();
}

void draw()
{
  background(#eeeeee);
  world.draw();
  ui.draw();
}
