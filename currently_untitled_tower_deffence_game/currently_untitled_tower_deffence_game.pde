float[] pathX = {0f, 600f, 600f, 100f, 100f};
float[] pathY = {100f, 100f, 700f, 700f, 800f};

void setup()
{
  size(800, 800);
}

void draw()
{
  background(#009911);
  stroke(#FFD9A0);
  strokeWeight(50);
  for(int i = 1; i < pathX.length; i++)
  {
    line(pathX[i - 1], pathY[i - 1], pathX[i], pathY[i]);
  }
}
