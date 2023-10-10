float barY;
float barYV;
int bckColor;
float open;
float eY;

void setup() {
  size(800, 600);
  rectMode(CENTER);
  barY = height/2;
  bckColor = #3F36CE;
  open = 0;
  eY = height/2;
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

  if (mouseX < 400)
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
  float yGoal;
  float openGoal;

  if (mouseY < 100)
  {
    yGoal = 100;
  } else if (mouseY > 500)
  {
    yGoal = 500;
  } else
  {
    yGoal = mouseY;
  }

  if (open == 0)
  {
    if (eY < yGoal)
    {
      eY = eY + 4;
    } else
    {
      eY = eY - 4;
    }
  }

  if ((eY == 500 || eY == 100) && (yGoal == 500 || yGoal == 100))
  {
    openGoal = abs(400 - mouseX)/10;
    if (openGoal > 30)
    {
      openGoal = 30;
    }
  } else
  {
    openGoal = 0;
  }

  if (open < openGoal)
  {
    open = open + 1;
  } else
  {
    open = open - 1;
  }

  fill(#8E8E8E);
  rect(width/2 - 30 - open, eY, 60, 160);
  rect(width/2 + 30 + open, eY, 60, 160);
  fill(#000000);
  rect(width/2, eY, 3 + open * 2, 160);
}
