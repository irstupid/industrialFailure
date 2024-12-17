float xPos;
float yPos;

void setup() {
  size(2000,900);
  xPos = 0;
  yPos = 450;
}

void draw() {
  background(0);
  displayThing(xPos, yPos);
  xPos += 2;
  yPos += 0;
}

void displayThing(float x, float y) {
  push();
  translate(x, y);
  rectMode(CENTER);
  strokeWeight(0);
  fill(#0099ff);
  ellipse(0, -40, 100, 100);
  fill(#555555);
  ellipse(0, 0, 250, 80);
  fill(#bb0000);
  ellipse(-100, 0, 20, 20);
  ellipse(-50, 0, 20, 20);
  ellipse(0, 0, 20, 20);
  ellipse(50, 0, 20, 20);
  ellipse(100, 0, 20, 20);
  pop();
}
