int depth = 50;
float resolution = 50;
int substeps;

PVector c;

void setup()
{
  size(800, 800);
  noStroke();
  colorMode(HSB, depth);
  
  c = new PVector(0, 0);
}

void draw()
{
  translate(width/2, height/2);
  
  c.x += 2/resolution;
  if(c.x > 1.0001) 
  { 
    c.x = -1;
    c.y += 2/resolution;
  }
  if(c.y > 1)
  {
    c.y = -1;
  }
  
  println(c);
  PVector z = c;
  int n = 0;
  for(; n < depth; n++)
  {
    z = step(z, c);
    if(abs(z.x) > 10000 || abs(z.y) > 10000) { break; }
    println(z);
  }
  println(n);
  fill(n, depth, (n < depth ? depth : 0));
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
