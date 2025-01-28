int FSM1State = 0;
int FSM2State = 0;
int FSM2Time = 0;
int FSM3State = 0;
int FSM3Time = 0;

void setup()
{
  size(800 ,800);
}

void draw()
{
  background(90);
  FSM1(width/2, height/2, 1);
  FSM2(width/2 - 100, height/2, 1);
  FSM3(width/2 + 100, height/2, 1);
  
  FSM2Time++;
  if(FSM2Time >= 120 && FSM2State == 0)
  {
    FSM2Time = 0;
    FSM2State = 1;
  }
  else if(FSM2Time >= 120 && FSM2State == 1)
  {
    FSM2Time = 0;
    FSM2State = 2;
  }
  else if(FSM2Time >= 120 && FSM2State == 2)
  {
    FSM2Time = 0;
    FSM2State = 0;
  }
  
  FSM3Time++;
  if(FSM3Time >= 120 && FSM3State == 0)
  {
    FSM3Time = 0;
    FSM3State = 1;
  }
  else if(FSM3Time >= 120 && FSM3State == 1)
  {
    FSM3Time = 0;
    FSM2State = 2;
  }
  else if(FSM3Time >= 120 && FSM3State == 2)
  {
    FSM3Time = 0;
    FSM3State = 0;
  }
}


void FSM1(float x, float y, float s)
{
  push();
    translate(x, y);
    scale(s);
    textSize(100);
    text(FSM1State, 0, 0);
  pop();
}

void FSM2(float x, float y, float s)
{
  push();
    translate(x, y);
    scale(s);
    textSize(100);
    text(FSM2State, 0, 0);
  pop();
}

void FSM3(float x, float y, float s)
{
  push();
    translate(x, y);
    scale(s);
    textSize(100);
    text(FSM3State, 0, 0);
  pop();
}

void keyPressed()
{
  if(FSM1State == 0 && key == ' ')
  {
    FSM1State = 1;
  }
  else if(FSM1State == 1 && key == ' ')
  {
    FSM1State = 2;
  }
  else if(FSM1State == 2 && key == ' ')
  {
    FSM1State = 0;
  }
  
  if(FSM3State == 0 && key == ' ')
  {
    FSM3State = 1;
    FSM3Time = 0;
  }
  else if(FSM1State == 1 && key == ' ')
  {
    FSM3State = 2;
    FSM3Time = 0;
  }
  else if(FSM1State == 2 && key == ' ')
  {
    FSM3State = 0;
    FSM3Time = 0;
  }
}
