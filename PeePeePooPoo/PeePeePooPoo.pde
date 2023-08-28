float xPos;
float yPos;
float xVelo;
float yVelo;
float gravity;
float BounceDecay;

void setup() {
  size(800,600);
  xPos = 20;
  yPos = 180;
  xVelo = 2;
  yVelo = 0;
  BounceDecay = 1;
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
    if(yVelo < 2)
    {
      yVelo = 2;
    }
    yVelo = -yVelo + BounceDecay;
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
  fill(#ffffff);
  ellipse(0, -25, 40, 40);
  fill(#000000);
  ellipse(0, -25, 15, 15);
  pop();
}
