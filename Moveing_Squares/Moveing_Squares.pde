float x;
float y;

void setup() 
{
  size(800,600);
  x = 0;
  y = 0;
}

void draw() 
{
  rectMode(CENTER);
  background(90);
  fill(#ffffff);
  ellipse(275, 450, 50, 50);
  fill(#000000);
  text("starzk circle", 275, 450);
  fill(#ffffff);
  rect(200, 300, 50, y);
  fill(#000000);
  if(y < height + 300)
  {
    rect(700, 450, 50, height + 300 - y);
  }
  else
  {
    rect(700, 450, 50, 0);
  }
  fill(#884400);
  rect(550, 500, x, 50);
  fill(#ff0000);
  rect(x, 275, 50, 50);
  fill(#0000ff);
  rect(width - x, 175, 50, 50);
  fill(#00ff00);
  rect(400, y, 50, 50);
  fill(#ffff00);
  rect(750, height - y, 50, 50);
  fill(#ff8800);
  rect(x + (0.1 * x), height - y, 50, 50);
  fill(#ff8888);
  rect((width/2) + x, height - (2 * x), 50, 50);
  fill(#ff00ff);
  rect(600 - x, y/2, 50, 50);
  x++;
  y++;
}
