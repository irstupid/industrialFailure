float x; 
float y;
float xVelo;
float yVelo;
float wVelo;
int frames;
int waterTimer;

void setup() {
  size(800,600);
  x = width/2;
  y = height/2;
  xVelo = 2;
  yVelo = 2;
  frames = 0;
  waterTimer = 0;
}

void draw() {
  background(90);
  fill(#ffffff);
  noStroke();
  x += xVelo;
  y += yVelo;
  ellipse(x, y, 40, 40);
  frames++;
  
  if(frames == 180)
  {
    xVelo = -xVelo;
    yVelo = -yVelo;
  }
  
  if(frames > 120)
  {
    ellipse(width/2 + frames - 120, height/2 - frames + 120, 40, 40);
  }
  
  if(frames < 120)
  {
    ellipse(width/4, height/3, 40 + frames * 2, 40 + frames * 2);
  }
  
  waterTimer++;
  fill(#0AB8FA);
  ellipse(width/2, 30, 40, 40);
  ellipse(width/2, 30 + (waterTimer * 1) * (0.001 * waterTimer * waterTimer), 20, 20);
  if(waterTimer == 120)
  {
    waterTimer = 0;
  }
}
