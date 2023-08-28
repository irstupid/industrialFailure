float xPos;
float yPos;

void setup() {
  size(800,600);
  xPos = 800;
  yPos = 40;
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
  strokeWeight(4);
  stroke(255);
  rect(0, 0, 50, 100);
  ellipse(0, 0, 60, 60);
  pop();
}
