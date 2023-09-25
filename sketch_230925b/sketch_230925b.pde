void setup()
{
  size(800, 600);
  background(255);
  nuke(0, 0, 1, 0);
}

void nuke(float x, float y, float s, float r) {
  //By Ian Brost
  pushMatrix();
  translate(x, y);
  scale(s);
  rotate(r);
  rectMode(CENTER);
  
  //drawing code
  noStroke();
  fill(#405543);
  triangle(450, 300, 700, 400, 700, 200);
  ellipse(400, 300, 400, 300);
  fill(#ffff00);
  ellipse(400, 300, 200, 200);
  fill(#405543);
  triangle(400, 300, 350, 200, 450, 200);
  triangle(400, 300, 525, 300, 450, 400);
  triangle(400, 300, 275, 300, 350, 400);
  ellipse(400, 300, 75, 75);
  fill(#ffff00);
  ellipse(400, 300, 50, 50);
  fill(#000000);
  textSize(100);
  text("Kaboom?", 225, 100);
  
  popMatrix();
}
