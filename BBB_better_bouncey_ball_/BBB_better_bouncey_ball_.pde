float x;
float xVelo;
float y;
float yVelo;
int colorTimer;
int bckColor;
int lifeTimer;
boolean alive;

void setup() {
  size(800, 600);
  x = width/2;
  xVelo = 5;
  y = 300;
  yVelo = 0;
  colorTimer = 0;
  bckColor = 0;
  lifeTimer = 0;
  alive = false;
  strokeWeight(10);
  colorMode(HSB, 255, 100, 100);
  rectMode(CENTER);
  textSize(128);
  textAlign(CENTER);
}

void draw() {
  background(bckColor, 100, 100);
  if (alive)
  {
    //bounce and teleport
    x = x + xVelo;
    if (x > width - 40 || x < 40) {
      xVelo = -xVelo;
      //background Color
      if (bckColor == 0)
      {
        bckColor = 80;
      } else if (bckColor == 80)
      {
        bckColor = 175;
      } else if (bckColor == 175)
      {
        bckColor = 40;
      } else if (bckColor == 40)
      {
        bckColor = 0;
      }
    }
    if (y < 0)
    {
      y = height;
    }
    if (y > height)
    {
      y = 0;
    }
    //color
    colorTimer++;
    if (colorTimer == 255)
    {
      colorTimer = 0;
    }
    //y movement
    if (mouseY < 200) {
      yVelo = -5;
    } else {
      yVelo = 5;
    }
    y += yVelo;
  }
  //life timer
  if (alive)
  {
    lifeTimer++;
  }
  if (lifeTimer >= 200)
  {
 x = width/2;
  xVelo = 5;
  y = 300;
  yVelo = 0;
  colorTimer = 0;
  lifeTimer = 0;
  alive = false;
  }

  //draw
  fill(colorTimer, 100, 100);
  if (lifeTimer > 20)
  {
    ellipse(x, y, 80, 80);
  }
  if(alive)
  {
    
  }
  else
  {
  text("press space", width/2, height/2);
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    alive = true;
  }
}
