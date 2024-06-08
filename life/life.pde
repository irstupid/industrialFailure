ArrayList<Particle> particles;

float range = 80;
int types = 2;

float[][] aversion;

void setup()
{
  size(800, 800);
  colorMode(HSB);
  
  particles = new ArrayList<Particle>();
  for(int i = 0; i < 200; i++)
  {
    particles.add(new Particle(random(0, width), random(0, height), floor(random(1, types + 1))));
  }
  
  aversion = new float[types][types];
  for(int i = 0; i < types; i++)
  {
    for(int j = 0; j < types; j++)
    {
      aversion[i][j] = random(-1, 1);
    }
  }
}

void draw()
{
  background(90);
  for(int i = 0; i < particles.size(); i++)
  {
    particles.get(i).act(particles);
    particles.get(i).update();
    particles.get(i).draw();
  }
}
