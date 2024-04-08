Ball ball;

void setup()
{
  colorMode(HSB, 255, 100, 100);
  size(1920, 1080);
  
  ball = new Ball();
}

void draw()
{
  background(90);
  ball.draw();
}
