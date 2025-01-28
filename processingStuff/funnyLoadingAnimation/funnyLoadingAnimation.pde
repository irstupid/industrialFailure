float centerR = 0;
float edgeR = 180;
float orbitR;
boolean ballOrbit;
float ballR;
int state;

void setup()
{
  size(800, 800);
}

void draw()
{
  if(state == 0)
  {
    centerR += 1;
    edgeR += 1;
    orbitR += 0;
    ballOrbit = true;
    ballR += 4;
    
    if(ballR >= 360)
    {
      state = 1;
    }
  }
  if(state == 1)
  {
    centerR += 0;
    edgeR -= 1;
    orbitR += 1;
    ballOrbit = false;
    ballR -= 4;
    
    if(orbitR >= 90)
    {
      ballR = 90;
      state = 2;
    }
  }
  if(state == 2)
  {
    centerR += 1.33333;
    edgeR += 1.333333;
    orbitR += 0;
    ballOrbit = true;
    ballR += 5;
    
    if(ballR >= 450)
    {
      ballR = 0;
      state = 3;
    }
  }
  if(state == 3)
  {
    centerR += 0;
    edgeR -= 1;
    orbitR += 1;
    ballOrbit = false;
    ballR -= 4;
    
    if(orbitR >= 180)
    {
      ballR = 180;
      state = 4;
    }
  }
  if(state == 4)
  {
    centerR += 1.33333;
    edgeR += 1.33333;
    orbitR += 0;
    ballOrbit = true;
    ballR += 5;
    
    if(ballR >= 540)
    {
      ballR = 0;
      state = 5;
    }
  }
  if(state == 5)
  {
    centerR += 0;
    edgeR -= 1;
    orbitR += 1;
    ballOrbit = false;
    ballR -= 4;
    
    if(orbitR >= 270)
    {
      ballR = 180;
      state = 6;
    }
  }
  
  background(90);
  funnySpinnyThing();
}

void funnySpinnyThing()
{
  push();
    translate(width/2, height/2);
    rotate(radians(centerR));
    noStroke();
    fill(#D1F579);
    arc(0, 0, width/4, height/4, 0, HALF_PI + PI);
    fill(90);
    ellipse(0, 0, width/6, height/6);
  pop();
  
  push();
    translate(width/2, height/2);
    rotate(radians(orbitR));
    translate((width * 5)/24, 0);
    rotate(radians(edgeR));
    noStroke();
    fill(#D1F579);
    arc(0, 0, width/4, height/4, 0, HALF_PI + PI);
    fill(90);
    ellipse(0, 0, width/6, height/6);
  pop();
  
  push();
    noStroke();
    translate(width/2, height/2);
    if(!ballOrbit)
    {
      rotate(radians(orbitR));
      translate((width * 5)/24, 0);
    }
    rotate(radians(ballR) + radians(ballOrbit ? 0 : 180));
    translate(width/8 - width/48, 0);
    fill(#cccccc);
    ellipse(0, 0, width/24, height/24);
  pop();
}
