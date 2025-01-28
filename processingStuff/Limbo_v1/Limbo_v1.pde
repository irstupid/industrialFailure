float barY;
float barYV;
float open;
float eY;

float ballX;
float ballY;
float ballV;

void setup() {
  size(800, 600);
  rectMode(CENTER);
  barY = height/2;
  open = 0;
  eY = height/2;

  ballX = -100;
  ballY = -100;
  ballV = 0;
}

void draw() {
  background(mouseX > 400 ? #861212 : #3F36CE);

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
  float angle;

  angle = atan2(mouseY - height/2, mouseX - width/5);
  fill(#222222);
  ellipse(width/5, height/2, 100, 100);
  push();
  translate(width/5, height/2);
  rotate(angle);
  rect(50, 0, 100, 30);
  pop();
  ellipse(ballX, ballY, 50, 50);
  ballX += cos(angle) * ballV/3;
  ballY += sin(angle) * ballV/3;

  if ((mouseX < 20 || mouseX > width - 20 || mouseY < 20 || mouseX > height - 20) && !(pmouseX < 20 || pmouseX > width - 20 || pmouseY < 20 || pmouseX > height - 20))
  {
    ballX = width/5;
    ballY = height/2;
    ballV = sqrt(sq(abs(mouseX - pmouseX)) + sq(abs(mouseY - pmouseY)));
  }
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

  //Buttons
  if (eY == 100)
  {
    fill(#B709DB);
  } else
  {
    fill(#460752);
  }
  ellipse(width/2 + 135, 100, 30, 30);

  if (eY == 500)
  {
    fill(#B709DB);
  } else
  {
    fill(#460752);
  }
  ellipse(width/2 + 135, 500, 30, 30);
}
