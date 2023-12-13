float ballX;
float ballY;
float ballXV;
float ballYV;
float ballspeed;
float clickX;
float clickY;
boolean activeHook;

void setup()
{
  size(800, 800);
  ballX = width/2;
  ballY = height/2;
  activeHook = false;
}

void draw()
{
  background(90);
  ball(ballX, ballY);
  if(activeHook)
  {
    hook();
  }
}

void mouseClicked()
{
  clickX = mouseX;
  clickY = mouseY;
  activeHook = true;
}

void ball(float x, float y)
{
  if(activeHook)
  {
    ballXV = (ballX - clickX)/-abs(ballX - clickX);
  }
  else
  {
    
  }
  
  ballX += ballXV;
  
  push();
  translate(x, y);
  ellipse(0, 0, 100, 100);
  pop();
}

void hook()
{
  line(ballX, ballY, clickX, clickY);
}
