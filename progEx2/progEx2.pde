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
  fill(#006600);
  strokeWeight(4);
  stroke(255);
  rect(0, 0, 50, 100);
  ellipse(0, 0, 60, 60);
  pop();
}
