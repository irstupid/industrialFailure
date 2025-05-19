final float TILEWIDTH = 50;
final float TILEHEIGHT = 50;

World world;
TextBox textBox;

void setup()
{
  fullScreen();
  //size(800, 800);
  
  world = new World();
  textBox = new TextBox();
}

void draw()
{
  world.giveText(textBox.getText());
  world.update();
  textBox.setText(world.describe());
  world.draw();
  textBox.draw();
}

void keyPressed()
{
  world.keyPressed();
  textBox.keyPressed();
}

void keyReleased()
{
  world.keyReleased();
}
