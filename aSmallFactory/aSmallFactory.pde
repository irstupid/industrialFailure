float scale;

Belt belt;
OrePatch[] ore;

void setup()
{
  size(80 * 18, 80 * 13);
  scale = 80;
  ore = new OrePatch[3];
  ore[0] = new OrePatch(0);
  ore[1] = new OrePatch(1);
  ore[2] = new OrePatch(2);
  
  ore[0].additive();
  ore[1].additive();
  ore[2].additive();
  
  belt = new Belt(5, 5, new PVector(2, 0));
}

void draw()
{
  for(int i = 0; i <= 18; i++)
  {
    line(i * scale, 0, i * scale, height);
  }
  for(int i = 0; i <= 13; i++)
  {
    line(0, i * scale, width, i * scale);
  }
  
  ore[0].draw();
  ore[1].draw();
  ore[2].draw();
  
  belt.draw();
}
