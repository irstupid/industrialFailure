void setup() {
  size(800,600);
}

void draw() {
  background(90);
  displayThing(width/2, 200);
}

void displayThing(float x, float y) {
  push();
  translate(x, y);
  rectMode(CENTER);
  fill(#00ff00);
  strokeWeight(0);
  rect(0, 0, 50, 100);
  fill(#ffffff);
  ellipse(0, -25, 40, 40);
  fill(#000000);
  ellipse(0, -25, 15, 15);
  pop();
}
