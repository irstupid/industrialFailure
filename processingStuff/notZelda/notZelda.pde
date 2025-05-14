final float TILEWIDTH = 50;
final float TILEHEIGHT = 50;

World world;
TextBox textBox;

void setup()
{
  size(800, 800);
  
  world = new World();
  textBox = new TextBox();
}

void draw()
{
  world.update();
  world.draw();
  textBox.draw();
}

void keyPressed()
{
  world.keyPressed();
}

void keyReleased()
{
  world.keyReleased();
}
