float x; 
float y;
float xVelo; 
float yVelo;
float circleX;
float circleY;
float circleXVelo;
float circleYVelo;

float gravity;

void setup() {
  size(800,600);
  x = 0;
  y = height * 0.1;
  xVelo = 7;
  yVelo = 0;
  circleXVelo = 8;
  circleYVelo = 6;
  gravity = 1;
}

void draw() {
  x = x + xVelo;
  y = y + yVelo;
  circleX += circleXVelo;
  circleY += circleYVelo;
  yVelo = yVelo + gravity;
  rect(x, y, 80, 60);
  ellipse(circleX, circleY, 50, 50);
}
