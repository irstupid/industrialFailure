float AlienX;
float AlienSpeed;
float AlienDirection;

float UFOX;
float UFOY;
float UFOXVelo;
float UFOYVelo;

color[] Colors = {#ff0000, #ffff00, #0000ff, #ff0000, #ffff00, #0000ff};
int ColorIndex;
int ColorTimer;

float[] StarsX;
float[] StarsY;

PVector LazerDirection;
float LazerSpeed;

void setup() {
  size(800,600);
  AlienX = 300;
  AlienSpeed = 5;
  UFOX = 400;
  UFOY = 300;
  StarsX = new float[50];
  StarsY = new float[50];
    int i = 0;
    while(i < 50)
  {
    StarsX[i] = random(0, 800);
    StarsY[i] = random(0, 450);
    i++;
  }
}

void draw() {
  background(0);
  Draw();
  Alien();
  UFO();
}

void Draw()
{
  //Draw Star
  int i = 0;
  while(i < 50)
  {
    strokeWeight(0);
    fill(#ffffff);
    ellipse(StarsX[i], StarsY[i], 5, 5);
    i++;
  }
  //Draw Ground
  strokeWeight(0);
  fill(#999999);
  rect(0, 450, 800, 150);
  //Draw Alien
  strokeWeight(0);
  fill(#00ff00);
  rect(AlienX, 400, 50, 100);
  fill(#ffffff);
  ellipse(AlienX + 25, 425, 40, 40);
  fill(#000000);
  ellipse(AlienX + 25, 425, 10, 10);
  //Draw UFO
  fill(#00ffff);
  ellipse(UFOX, UFOY - 50, 75, 75);
  fill(#666666);
  ellipse(UFOX, UFOY, 225, 75);
  
  if(ColorTimer == 5)
  {
    ColorIndex = int(random(Colors.length / 2));
    ColorTimer = 0;
  }
  else
  {
    ColorTimer++;
  }
    fill(Colors[ColorIndex]);
  ellipse(UFOX, UFOY, 25, 25);
    fill(Colors[ColorIndex + 1]);
  ellipse(UFOX + 50, UFOY, 25, 25);
    fill(Colors[ColorIndex + 2]);
  ellipse(UFOX - 50, UFOY, 25, 25);
}

void Lazer()
{
  LazerDirection = new PVector(UFOX - AlienX, UFOY - 400);
}

void Alien()
{
  //Move Alien
  if(AlienDirection == 1)
  {
   AlienX += AlienSpeed;
  }
  else
  {
    AlienX -= AlienSpeed;
  }
  
  if(AlienX >= 625 & AlienDirection == 1)
  {
    AlienDirection = 0;
  }
  
  if(AlienX <= 100 & AlienDirection != 1)
  {
    AlienDirection = 1;
  }
}

void UFO()
{
  //Draw UFO
  if(random(0, 20) <= 1)
  {
  UFOXVelo = random(-8, 8);
  UFOYVelo = random(-8, 8);
  }
  
  UFOX += UFOXVelo;
  UFOY += UFOYVelo;
  
  if(UFOX > 800)
  {
    UFOX = 0;
  }
  if(UFOX < 0)
  {
    UFOX = 800;
  }
  if(UFOY > 600)
  {
    UFOY = 0;
  }
  if(UFOY < 0)
  {
    UFOY = 600;
  }
}
