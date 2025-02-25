int depth = 50;
float resolution = 200;
int substeps = 1000;
float speed = 0.1;

PVector c;

float x;
float y;

void setup()
{
  size(800, 800);
  noStroke();
  colorMode(HSB, depth);
  
  c = new PVector(-1, -1);
}

void draw()
{
  translate(width/2, height/2);
  
  for(int q = 0; q <= substeps; q++)
  {
    c.x += 2/resolution;
    if(c.x > 1f) 
    { 
      c.x = -1;
      c.y += 2/resolution;
    }
    if(c.y > 1f)
    {
      c.y = -1;
    }
    
    PVector tC = c.copy();
    tC.x += x;
    tC.y += y;
    PVector z = tC;
    int n = 0;
    for(; n < depth; n++)
    {
      z = step(z, tC);
      if(abs(z.x) > 10000 || abs(z.y) > 10000) { break; }
    }
    
    fill(n, depth, (n < depth ? depth : 0));
    rect(c.x * width/2, c.y * height/2, width/resolution, height/resolution);
  }
}

PVector step(PVector z, PVector c)
{
  z = square(z);
  z = z.add(c);
  return z;
}

PVector square(PVector a)
{
  float r = a.x;
  float i = a.y;
  float first = r * r - i * i;
  float second = r * i * 2;
  return new PVector(first, second);
}

void keyPressed()
{
  switch(key)
  {
    case 'w':
      y -= speed;
    break;
    case 'a':
      x -= speed;
    break;
    case 's':
      y += speed;
    break;
    case 'd':
      x += speed;
    break;
  }
}
