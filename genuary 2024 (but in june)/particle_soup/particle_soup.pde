ArrayList<Particle> particles;
ArrayList<Rule> rules;

int types = 6;
float friction = 50;
float pushForce = 5;
float pushRange = 40;
float sight = 300;
float speedLimit = 50;
float volatility = 0.3;
float anger = 0.75;
int particleAmount = 300;

void setup()
{
  fullScreen(P2D);
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
      rules.add(new Rule(i, j, random(-anger, anger)));
    }
  }
  //rules.add(new Rule(1, 1, 0.1));
  //rules.add(new Rule(2, 1, -0.1));
  //rules.add(new Rule(1, 2, 0.1));
  //rules.add(new Rule(2, 2, 0.1));
  //rules.add(new Rule(3, 1, 0.1));
  //rules.add(new Rule(1, 3, -0.1));
  //rules.add(new Rule(3, 2, 0.1));
  //rules.add(new Rule(2, 3, -0.1));
  //rules.add(new Rule(3, 3, -0.1));
}

void draw()
{
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

void keyPressed()
{
  if(key == ' ')
  { 
    rules = new ArrayList<Rule>();
    for(int i = 0; i <= types; i++)
    {
      for(int j = 0; j <= types; j++)
      {
        rules.add(new Rule(i, j, random(-anger, anger)));
      }
    }
  }
}
