ScaleFrame scaleFrame;

void setup()
{
  size(800, 400);
  scaleFrame = new ScaleFrame(800, 800);
}

void draw()
{
  scaleFrame.transform();
  background(#00ff00);
  rect(0, 0, 800, 800);
  ellipse(400, 400, 50, 50);
  scaleFrame.border();
}
