int depth = 50;
float resolution = 10;
int substeps;

PVector c;

void setup()
{
  size(800, 800);
  noStroke();
  colorMode(HSB);
  
  c = new PVector(-1, -1);
}

void draw()
{
  translate(width/2, height/2);
  
  c.x += 1/resolution;
  if(c.x > 1.0001) 
  { 
    c.x = -1;
    c.y += 1/resolution;
  }
  if(c.y > 1)
  {
    c.y = -1;
  }
  
  
  PVector z = c;
  int n = 0;
  for(; n < depth; n++)
  {
    z = step(z, c);
    if(abs(z.x) > 100 || abs(z.y) > 100) { break; }
  }
  fill((255/depth) * n);
  rect(c.x * width/2, c.y * height/2, width/resolution, height/resolution);
}

PVector step(PVector z, PVector c)
{
  z = square(z);
  z = z.add(c);
  return z;
}

PVector square(PVector a)
{
  return new PVector(a.x * a.x, a.y * a.y * -1);
}
