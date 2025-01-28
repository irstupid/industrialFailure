ArrayList<Particle> particles;
ArrayList<Rule> rules;

int types = 6;
float friction = 50;
float pushForce = 1;
float pushRange = 15;
float sight = 300;
float speedLimit = 50;
float volatility = 0.3;
float maxAnger = 0.75;
float minAnger = 0;
int particleAmount = 200;

void setup()
{
  //fullScreen(P2D);
  size(800, 800, P2D);
  noStroke();
  
  particles = new ArrayList<Particle>();
  for(int j = 1; j <= types; j++)
  {
    for(int i = 0; i < particleAmount; i++)
    {
      particles.add(new Particle(random(0, width), random(0, height), j));
    }
  }
  
  rules = new ArrayList<Rule>();
  for(int i = 0; i <= types; i++)
  {
    for(int j = 0; j <= types; j++)
    {
      rules.add(new Rule(i, j, random(minAnger, maxAnger) * (random(0, 2) > 1 ? 1 : -1)));
    }
  }
}

void draw()
{
  println(density(mouseX, mouseY));
  background(#000022);
  for(int i = 0; i < rules.size(); i++)
  {
    rules.get(i).draw();
  }
  for(int i = 0; i < particles.size(); i++)
  {
    particles.get(i).draw();
  }
}

float density(float x, float y)
{
  float density = 0;
  for(int i = 0; i < particles.size(); i++)
  {
    density += dist(x, y, particles.get(i).x, particles.get(i).y);
  }
  density = density / particles.size();
  return 1/density;
}

void keyPressed()
{
  if(key == ' ')
  { 
    for(int i = 0; i < particles.size(); i++)
  {
    particles.get(i).xV = random(-speedLimit/2, speedLimit/2);
    particles.get(i).yV = random(-speedLimit/2, speedLimit/2);
  }
    rules = new ArrayList<Rule>();
    for(int i = 0; i <= types; i++)
    {
      for(int j = 0; j <= types; j++)
      {
        rules.add(new Rule(i, j, random(minAnger, maxAnger) * (random(0, 2) > 1 ? 1 : -1)));
      }
    }
  }
}
