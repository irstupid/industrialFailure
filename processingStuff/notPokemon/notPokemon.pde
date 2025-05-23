final float TILEWIDTH = 50;
final float TILEHEIGHT = 50;

World world;
TextBox textBox;
Battle battle;

void setup()
{
  //fullScreen(P2D);
  size(800, 800, P2D);
  
  world = new World();
  textBox = new TextBox();
  battle = new Battle();
}

void draw()
{
  //world.giveText(textBox.getText());
  //world.update();
  //textBox.setText(world.describe());
  //world.draw();
  battle.draw();
  textBox.draw();
}

void keyPressed()
{
  //world.keyPressed();
  if(textBox.getText().equals(""))
  {
    battle.keyPressed();
  }
  textBox.keyPressed();
}

void keyReleased()
{
  //world.keyReleased();
}
