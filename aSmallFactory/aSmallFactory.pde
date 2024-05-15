float scale;

OrePatch[] ore;

void setup()
{
  fullScreen();
  scale = height/13;
  ore = new OrePatch[3];
  ore[0] = new OrePatch(0);
  ore[1] = new OrePatch(1);
  ore[2] = new OrePatch(2);
  
  ore[0].additive();
  ore[1].additive();
  ore[2].additive();
}

void draw()
{
  ore[0].draw();
  ore[1].draw();
  ore[2].draw();
}
