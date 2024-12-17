float x;
float y;
float a;
float c1;
float c2;
float c3;

void setup() 
{
  size(800,600);
  x = 0;
  y = 0;
  a = 255;
  c1 = 127.5;
  c2 = 127.5;
  c3 = 127.5;
}

void draw() 
{
  rectMode(CENTER);
  background(a);
  
  stroke(x, x, x, a);
  fill(x, x, x, a);
  rect(425, 350, 50, 50);
  stroke(0, a);
  
  fill(#ffff00);
  ellipse(400, 500 + x/8, 200, 200);
  fill(a);
  rect(400, height, 800, 150);
  fill(#006600, a);
  rect(400, height, 800, 150);
  
  fill(#ffffff, a);
  ellipse(275, 480, 50, 50);
  fill(#000000, a);
  text("starzk", 260, 475);
  text("circle", 260, 490);
  
  noStroke();
  fill(#999999, a);
  if(x < 100)
  {
    rect(100, 400, 50, 150);
    rect(50, 400, 50, 150);
    fill(0, a);
    rect(75, 400, 2, 150);
  }
  else if(x < 150)
  {
    rect(100 + (x - 100), 400, 50, 150);
    rect(50 - (x - 100), 400, 50, 150);
    fill(0, a);
    rect(75, 400, ((x - 100) * 2) + 2, 150);
  }
  else
  {
    rect(150, 400, 50, 150);
    rect(0, 400, 50, 150);
    fill(0, a);
    rect(75, 400, 102, 150);
  }
  stroke(1);
  
  fill(#ffffff, a);
  rect(200, 300, 50, y);
  fill(#000000, a);
  if(y < height + 300)
  {
    rect(700, 450, 50, height + 300 - y);
  }
  else
  {
    rect(700, 450, 50, 0);
  }
  fill(#884400, a);
  rect(550, 425, x, 50);
  fill(#666666, a);
  if(y < width + 300)
  {
    rect(375, 250, width + 300 - y, 50);
  }
  else
  {
    rect(375, 250, 0, 50);
  }
  
  fill(#ff0000, a);
  rect(x, 275, 50, 50);
  fill(#0000ff, a);
  rect(width - x, 175, 50, 50);
  fill(#00ff00, a);
  rect(400, y, 50, 50);
  fill(#ffff00, a);
  rect(750, height - y, 50, 50);
  fill(#ff8800, a);
  rect(x + (0.1 * x), height - y, 50, 50);
  fill(#ff8888, a);
  rect((width/2) + x, height - (2 * x), 50, 50);
  fill(#ff00ff, a);
  rect(600 - x, y/2, 50, 50);
  
  fill(#00ffff, a);
  rect( 400 + 100 * sin(x/10), 300 + 100 * cos(y/10), 50, 50);
  
  fill(c1, c2, c3, a);
  rect(800 - sq(x/20), 600 - sq(y/20), 50, 50);
  
  x++;
  y++;
  a = 255 - x/5;
  c1 = c1 + random(-20, 20);
  c2 = c2 + random(-20, 20);
  c3 = c3 + random(-20, 20);
}
