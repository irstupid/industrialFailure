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
  background(90);
  funnySpinnyThing();
  
  if(state == 0)
  {
    centerR++;
    edgeR++;
    
    if(centerR >= 90)
    {
      state = 1;
    }
  }
  if(state == 1)
  {
    centerR--;
    edgeR--;
    
    if(centerR <= 0)
    {
      state = 0;
    }
  }
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
    translate(width/2, height/2);
    if(!ballOrbit)
    {
      rotate(radians(orbitR));
      translate((width * 5)/24, 0);
    }
    rotate(radians(ballR));
    translate(width/4 + width/48, 0);
    fill(#cccccc);
    ellipse(0, 0, width/24, height/24);
  pop();
}
