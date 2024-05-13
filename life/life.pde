ArrayList<Particle> particles;
ArrayList<Particle>[] boxes;

float range = 80;

void setup()
{
  size(800, 800);
  colorMode(HSB);
  
  particles = new ArrayList<Particle>();
  for(int i = 0; i < 200; i++)
  {
    particles.add(new Particle(random(0, width), random(0, height), #ff0000));
  }
  
  boxes = new ArrayList[(int) ((width/range) * (height/range))];
  for(int i = 0; i < boxes.length; i++)
  {
    boxes[i] = new ArrayList<Particle>();
  }
}

void draw()
{
  for(int i = 0; i < boxes.length; i++)
  {
    boxes[i] = new ArrayList<Particle>();
  }
  for(int i = 0; i < particles.size(); i++)
  {
    particles.get(i).selfReport();
    particles.get(i).draw();
  }
}

void mouseClicked()
{
  for(int i = 0; i < boxes[2].size(); i++)
  {
    boxes[2].get(i).c = #00ff00;
  }
}
