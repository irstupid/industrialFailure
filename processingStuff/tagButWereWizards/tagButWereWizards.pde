Player player;
Box box;

void setup()
{
  size(960, 540);
  player = new Player();
  
  box = new Box(width/2, height/2, 100, 100);
}

void draw()
{
  background(90);
  player.update();
  
  player.draw();
  
  box.draw();
  
  println(box.distance(mouseX, mouseY));
  ellipse(mouseX, mouseY, 10, 10);
}

void keyPressed()
{
   player.keyPressed();
}
  
void keyReleased()
{
  player.keyReleased();
}
