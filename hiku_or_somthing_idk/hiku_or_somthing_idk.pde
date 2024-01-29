
// i program robots
// they do not work at all
// i am very sad

void setup()
{
  size(800, 800);
}

void draw()
{
  line1();
}

void line1()
{
  background(#000000);
  strokeWeight(3);
  stroke(255);
  line(0, 150, 800, 150);
  line(200, 150, 200, 800);
  line(200, 200, 800, 200);
  javaClass(100, 100);
}

void line2()
{
  
}

void line3()
{
  
}

void javaClass(float x, float y)
{
  push();
    noStroke();
    fill(#2EE8FF);
    ellipse(x, y, 25, 25);
    textSize(20);
    fill(#000000);
    text("c", x - 5, y + 5);
  pop();
}
