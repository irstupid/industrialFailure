import java.awt.Robot;

Robot robot;

boolean
float x, y, z;

void setup()
{
  size(800, 800, P3D);
  noStroke();
  try
  {    
    robot = new Robot();
  }
  catch(Throwable e) { }
}

void draw()
{
  robot.mouseMove(width/2, height/2);
  background(0);
  lights();
  
  translate(x, y, z);
  
  box(100);
}
