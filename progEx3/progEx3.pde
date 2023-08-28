float xPos;
float yPos;

void setup() {
  size(1200,900);
  xPos = 1200;
  yPos = 0;
}

void draw() {
  background(90);
  displayThing(xPos, yPos);
  xPos += -2;
  yPos += 1;
}

void displayThing(float x, float y) {
  push();
  translate(x, y);
  rectMode(CENTER);
  fill(#00ff00);
  strokeWeight(0);
  rect(0, 0, 50, 100);
  ellipse(0, 0, 60, 60);
  pop();
}
