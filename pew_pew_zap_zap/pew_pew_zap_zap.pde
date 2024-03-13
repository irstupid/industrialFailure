import processing.sound.*;

SoundFile pew;
SoundFile explosion;
SoundFile zap;
SoundFile laserBounce;
SoundFile boop;
SoundFile hiss;
SoundFile bigBoom;
Sound s = new Sound(this);

Gun gun = null;
ArrayList<Particle> particles = new ArrayList<Particle>();

void setup()
{
  size(1200, 1200);
  gun = new Gun(width/2, height/2, 1);
  
  s.volume(1);
  pew = new SoundFile(this, "pew.wav");
  pew.amp(1);
  explosion = new SoundFile(this, "explosion.wav");
  explosion.amp(0.1);
  zap = new SoundFile(this, "zap.wav");
  zap.amp(0.5);
  laserBounce = new SoundFile(this, "laserBounce.wav");
  laserBounce.amp(0.5);
  boop = new SoundFile(this, "boop.wav");
  boop.amp(0.5);
  hiss = new SoundFile(this, "hiss.wav");
  hiss.rate(2);
  bigBoom = new SoundFile(this, "bigBoom.wav");
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
  if(key == ' ')
  {
    gun.type++;
    if(gun.type > 2)
    {
      gun.type = 0;
    }
  }
  if(key == '1')
  {
    gun.type = 0;
  }
  if(key == '2')
  {
    gun.type = 1;
  }
  if(key == '3')
  {
    gun.type = 2;
  }
}
