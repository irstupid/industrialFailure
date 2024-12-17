
float x;
float y;
float xVelo;
float yVelo;
int berryType = 1;
float r;
float rVelo;
float speed;

float SPEED = 2;
float ROTATE_SPEED = 9;
float DASH_SPEED = 5;

float scale = 0.5;
int scaleTimer = 0;
int dashTimer = 0;
int dashCooldown = 0;
boolean dashing = false;
boolean canDash = true;

boolean wPDD = false;
boolean sPDD = false;
boolean aPDD = false;
boolean dPDD = false;

boolean wPressed = false;
boolean aPressed = false;
boolean sPressed = false;
boolean dPressed = false;

ArrayList<Berry> berrys = new ArrayList<Berry>();

void setup()
{
  size(800, 800, P2D);
  x = width/2;
  y = height/2;
}

void draw()
{ 
  x += xVelo * speed;
  y += yVelo * speed;
  r += rVelo * ROTATE_SPEED;
  
  if(scaleTimer > 1)
  {
    if(scale < 1)
    {
      scale += 0.1;
    }
    
    scaleTimer -= 1;
  }
  else if(scale > 0.6)
  {
    scale -= 0.1;
  }
  
  if(dashTimer + 1 > 1)
  {
    rVelo = 1;
    dashTimer -= 1;
    speed = DASH_SPEED;
    dashing = true;
    canDash = false;
    
    if(dashTimer + 1 <= 1)
    {
      dashCooldown = 30;
      xVelo = 0;
      yVelo = 0;
      
      if(wPressed)
      {
        yVelo += -1;
        wPDD = false;
      }
      if(sPressed)
      {
        yVelo += 1;
        sPDD = false;
      }
      if(aPressed)
      {
        xVelo += -1;
        aPDD = false;
      }
      if(dPressed)
      {
        xVelo += 1;
        dPDD = false;
      }
    }
  }
  else
  {
    rVelo = 0;
    speed = SPEED;
    dashing = false;
  }
  
  if(dashCooldown > 1)
  {
    dashCooldown -= 1;
  }
  else if(!dashing)
  {
    canDash = true;
  }
  
  background(90);
  
  bush(x, y, r, scale, berryType);
  
  for(int i = 0; i < berrys.size(); i++)
  {
    berrys.get(i).draw();
  }
}

void mousePressed()
{
  berrys.add(new Berry(new PVector(x, y), atan2(mouseY - y, mouseX - x), berryType, 0, 0.5));
}

void keyPressed()
{
  if(key == 'w')
    {
      wPressed = true;
    }
    if(key == 's')
    {
      sPressed = true;
    }
    if(key == 'a')
    {
      aPressed = true;
    }
    if(key == 'd')
    {
      dPressed = true;
    }
  if(!dashing)
  {
    if(key == 'w')
    {
      yVelo += -1;
    }
    if(key == 's')
    {
      yVelo += 1;
    }
    if(key == 'a')
    {
      xVelo += -1;
    }
    if(key == 'd')
    {
      xVelo += 1;
    }
  }
  else
  {
    if(key == 'w')
    {
      wPDD = true;
    }
    if(key == 's')
    {
      sPDD = true;
    }
    if(key == 'a')
    {
      aPDD = true;
    }
    if(key == 'd')
    {
      dPDD = true;
    }
  }
  if(key == '1')
  {
    berryType = 1;
  }
  if(key == '2')
  {
    berryType = 2;
  }
  if(key == '3')
  {
    berryType = 3;
  }
  if(key == ' ' && canDash)
  {
    dashTimer = 40;
    
    if(wPressed)
    {
      wPDD = true;
    }
    if(sPressed)
    {
      sPDD = true;
    }
    if(aPressed)
    {
      aPDD = true;
    }
    if(dPressed)
    {
      dPDD = true;
    }
  }
}

void keyReleased()
{
  if(!dashing)
  {
    if(key == 'w')
    {
      if(!wPDD)
      {
        yVelo += 1;
      }
      else
      {
        wPDD = false;
      }
    }
    if(key == 's')
    {
      if(!sPDD)
      {
        yVelo += -1;
      }
      else
      {
        sPDD = false;
      }
    }
    if(key == 'a')
    {
      if(!aPDD)
      {
        xVelo += 1;
      }
      else
      {
        aPDD = false;
      }
    }
    if(key == 'd')
    {
      if(!dPDD)
      {
        xVelo += -1;
      }
      else
      {
        dPDD = false;
      }
    }
  }
  else
  {
    if(key == 'w')
    {
      wPDD = false;
    }
    if(key == 's')
    {
      sPDD = false;
    }
    if(key == 'a')
    {
      aPDD = false;
    }
    if(key == 'd')
    {
      dPDD = false;
    }
  }
  
    if(key == 'w')
    {
      wPressed = false;
    }
    if(key == 's')
    {
      sPressed = false;
    }
    if(key == 'a')
    {
      aPressed = false;
    }
    if(key == 'd')
    {
      dPressed = false;
    }
}

void bush(float x, float y, float r, float s, int type)
{
    push();
      translate(x, y);
      rotate(radians(r));
      translate(0, 50);
      scale(s);
      rectMode(CENTER);
      noStroke();
      fill(#29CE28);
      ellipse(50, -60, 50, 50);
      ellipse(65, -100, 50, 50);
      ellipse(40, -140, 50, 50);
      ellipse(10, -160, 50, 50);
      ellipse(-25, -140, 50, 50);
      ellipse(-55, -105, 50, 50);
      ellipse(-50, -60, 50, 50);
      ellipse(0, -90, 110, 110);
      fill(#E3912C);
      beginShape();
        vertex(75, -30);
        vertex(-75, -30);
        vertex(-35, 30);
        vertex(35, 30);
      endShape();
      rect(0, -40, 175, 20);
      berry(50, -80, 0, 1, type);
      berry(-30, -100, 0, 1, type);
      berry(20, -130, 0, 1, type);
    pop();
}

void berry(float x, float y, float r, float s, int type)
{
  if(type == 1)
  {
    push();
      translate(x, y);
      scale(s);
      rotate(radians(r));
      rectMode(CENTER);
      noStroke();
      fill(#F52F5D);
      ellipse(0, 0, 25, 25);
    pop();
  }
  else if(type == 2)
  {
    push();
      translate(x, y);
      scale(s);
      rotate(radians(r));
      rectMode(CENTER);
      noStroke();
      fill(#5748E0);
      ellipse(0, 0, 25, 25);
      push();
        translate(0, -12);
        rotate(radians(0));
        triangle(0, -7, 4, 0, -4, 0);
      pop();
      push();
        translate(7, -8);
        rotate(radians(30));
        triangle(0, -7, 4, 0, -4, 0);
      pop();
      push();
        translate(-7, -8);
        rotate(radians(-30));
        triangle(0, -7, 4, 0, -4, 0);
      pop();
    pop();
  }
  else if(type == 3)
  {
    push();
      translate(x, y);
      scale(s + 0.2);
      rotate(radians(r));
      rectMode(CENTER);
      noStroke();
      push();
        fill(#F5EAB2);
        translate(0, -7);
        rotate(radians(0));
        ellipse(0, 0, 5, 10);
      pop();
      push();
        fill(#F5EAB2);
        translate(3, -6);
        rotate(radians(50));
        ellipse(0, 0, 5, 10);
      pop();
      push();
        fill(#F5EAB2);
        translate(-3, -6);
        rotate(radians(-50));
        ellipse(0, 0, 5, 10);
      pop();
      fill(#FFB134);
      ellipse(-8, 0, 10, 10);
      ellipse(5, 6, 10, 10);
      fill(#FFD734);
      ellipse(8, 0, 10, 10);
      ellipse(-5, 6, 10, 10);
      fill(#FFB30D);
      ellipse(0, 0, 10, 10);
    pop();
  }
}
