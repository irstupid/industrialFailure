Fluid fluid;

void setup()
{
  size(800, 800);
  noStroke();
  fluid = new Fluid(width/10, height/10);
}

void draw()
{
  //fluid.update();
  fluid.draw();
}

void mouseClicked()
{
  fluid.addInk(mouseX, mouseY, 100);
}
