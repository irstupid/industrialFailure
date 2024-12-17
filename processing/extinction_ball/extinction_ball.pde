void setup()
{
  size(800, 600);
}

void draw()
{
  background(255);
  rectMode(CENTER);
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
}
