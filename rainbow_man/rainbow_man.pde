float x;
float y;
float xVelo;
float yVelo;
int c;

void setup() {
  size(800, 600);
  rectMode(CENTER);
  colorMode(HSB, 255, 100, 100);
  x = 100;
  y = height/2;
  xVelo = 4;
  yVelo = 0;
  c = 0;
}

void draw() {
  x += xVelo;
  y += yVelo;
  c++;
  if (x > width) {
    x = 0;
  }
  
  if(c > 255)
  {
    c = 0;
  }
  background(0, 0, 50);
  noStroke();
  fill(c, 100, 100);
  ellipse(x, y, 100, 100);
  rect(x + 50, y, 75, 37.5, 18.75);
  rect(x + 25, y + 50, 30, 75);
  rect(x - 25, y + 50, 30, 75);
  rect(x + 35, y + 85.5, 50, 30, 15);
  rect(x - 35, y + 85.5, 50, 30, 15);
  fill(0, 0, 100);
  ellipse(x, y - 25, 40, 40);
  ellipse(x, y + 25, 40, 40);
  stroke(100);
  fill(0, 0, 0);
  ellipse(x, y - 25, 10, 10);
  ellipse(x, y + 25, 10, 10);
}
