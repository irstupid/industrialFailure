Gun gun = null;

void setup()
{
  size(800, 800);
  gun = new Gun(width/2, height/2, 1);
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
