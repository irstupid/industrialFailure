Button button1 = new Button(200, 200);
Button button2 = new Button(600, 200);
Button button3 = new Button(200, 600);
Button button4 = new Button(600, 600);


void setup()
{
  size(800, 800);
}

void draw()
{
  background(#ffffff);
  button1.draw();
  button2.draw();
  button3.draw();
  button4.draw();
}

void mouseClicked()
{
  button1.click();
  button2.click();
  button3.click();
  button4.click();
}
