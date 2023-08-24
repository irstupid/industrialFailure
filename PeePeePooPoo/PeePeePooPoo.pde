float xPos;
float yPos;
float xVelo;
float yVelo;
float gravity;

void setup() {
  size(800,600);
  xPos = 20;
  yPos = 180;
  xVelo = 2;
  yVelo = 0;
  gravity = 0.4;
}

void draw() {
  background(90);
  displayThing(xPos, yPos);
  xPos += xVelo;
  yPos += yVelo;
  yVelo += gravity;
  if (xPos > width) {
    xPos = 0;
  }
  if (yPos > height - 50) {
    yVelo = -yVelo;
  }
}

void displayThing(float x, float y) {
  push();
  translate(x, y);
  rectMode(CENTER);
  fill(#00ff00);
  strokeWeight(4);
  stroke(255);
  rect(0, 0, 50, 100);
  ellipse(0, 0, 60, 60);
  pop();
}
