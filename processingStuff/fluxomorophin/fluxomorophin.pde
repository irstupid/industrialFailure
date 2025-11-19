ScaleFrame scaleFrame;

void setup()
{
  size(1920/2, 1080/2);
  scaleFrame = new ScaleFrame(1920, 1080);
}

void draw()
{
  scaleFrame.transform();
  background(#00ff00);
  scaleFrame.border();
}
