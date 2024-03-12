Gun gun = null;
ArrayList<Particle> particles = new ArrayList<Particle>();

void setup()
{
  size(800, 800);
  gun = new Gun(width/2, height/2, 1);
}

void draw()
{
  background(150);
  gun.draw();
  for(int i = 0; i < particles.size(); i++)
  {
    particles.get(i).draw();
  }
}

void mousePressed()
{
  gun.shoot();
}

void keyPressed()
{
  gun.type++;
  if(gun.type > 1)
  {
    gun.type = 0;
  }
}
