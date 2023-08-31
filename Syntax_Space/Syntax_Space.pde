float AlienX;
float AlienSpeed;
float AlienDirection;

float UFOX;
float UFOY;
float UFOXVelo;
float UFOYVelo;

void setup() {
  size(800,600);
  AlienX = 300;
  AlienSpeed = 5;
  UFOX = 400;
  UFOY = 300;
}

void draw() {
  background(0);
  Draw();
  Alien();
  UFO();
}

void Draw()
{
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
    fill(#ff0000);
  ellipse(UFOX, UFOY, 25, 25);
    fill(#0000ff);
  ellipse(UFOX + 50, UFOY, 25, 25);
    fill(#ffff00);
  ellipse(UFOX - 50, UFOY, 25, 25);
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
  if(random(0, 10) <= 1)
  {
  UFOXVelo = random(-8, 8);
  UFOYVelo = random(-8, 8);
  }
  
  UFOX += UFOXVelo;
  UFOY += UFOYVelo;
}
