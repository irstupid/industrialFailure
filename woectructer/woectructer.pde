float x; 
float y;
float xVelo; 
float yVelo;

void setup() {
  fullScreen();
  x = width/2;
  y = height/2;
  xVelo = width/1000;
  yVelo = height/1000;
}

void draw() {
  background(80);
  x = x + xVelo;
  y = y + yVelo;
  ellipse(x, y, (x - width/2)/2, (x - width/2)/2);
}
