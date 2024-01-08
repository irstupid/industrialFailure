float[][] path = {{0, 100}, {600, 100}, {600, 700}, {100, 700}, {100, 800}};

void setup()
{
  size(800, 800);
}

void draw()
{
  background(#009911);
  stroke(#FFD9A0);
  strokeWeight(50);
  for(int i = 1; i < path.length; i++)
  {
    line(path[i - 1][0], path[i - 1][1], path[i][0], path[i][1]);
  }
}
