float barY;
float barYV;
int bckColor;
float opened;


void setup() {
  size(800, 600);
  rectMode(CENTER);
  barY = height/2;
  bckColor = #3F36CE;
  opened = 0;
}

void draw() {
  background(bckColor);

  elavator();
  cannon();

  fill(#118811);
  rect(width/2, barY, width, 20);
  if (mouseY > barY)
  {
    barYV = 3;
  } else
  {
    barYV = -3;
  }
  barY += barYV;

  if (mouseX < 40)
  {
    bckColor = #861212;
  } else
  {
    bckColor = #3F36CE;
  }

  noStroke();
  if (mouseX >= width - 20 || mouseX <= 20 || mouseY >= height - 20 || mouseY <= 20)
  {
    fill(#861212);
  } else
  {
    fill(#000000);
  }
  rect(10, height/2, 20, height);
  rect(width - 10, height/2, 20, height);
  rect(width/2, 10, width, 20);
  rect(width/2, height - 10, width, 20);
}

void cannon()
{
}

void elavator()
{
  //float y;
  //float yVelo;
  //float openGoal;
  //float open;
  //fill(#8E8E8E);
  //rect(width/2 - 30 - open, y, 60, 160);
  //rect(width/2 + 30 + open, y, 60, 160);
  //fill(#000000);
  //rect(width/2, y, 3 + open * 2, 160);
}
