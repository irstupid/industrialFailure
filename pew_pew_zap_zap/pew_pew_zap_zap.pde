Gun gun = null;

void setup()
{
  size(800, 800);
  gun = new Gun(width/2, height/2, 2);
}

void draw()
{
  background(150);
  gun.draw();
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
