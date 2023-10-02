float x;
float y;
float xVelo;
float yVelo;
float size;
int shapeRed;
int shapeBlue;
int shapeGreen;
boolean shapeRedB;
boolean shapeGreenB;
boolean shapeBlueB;
color shapeColor;
int backgroundColor;
boolean shape;

void setup() {
  size(800, 600);
  x = width/2;
  y = height/2;
  xVelo = 5;
  yVelo = 5;
  size = 60;
  shapeColor = #1FFF03;
  backgroundColor = #000000;
  shape = true;
  rectMode(CENTER);
  shapeRed = int(random(0, 255));
  shapeGreen = int(random(0, 255));
  shapeBlue = int(random(0, 255));
}

void draw() {
  background(backgroundColor);
  x = x + xVelo;
  y = y + yVelo;

  if (shapeRedB)
  {
    shapeRed -= 2;
  } else
  {
    shapeRed += 2;
  }

  if (shapeGreenB)
  {
    shapeGreen -= 2;
  } else
  {
    shapeGreen += 2;
  }

  if (shapeBlueB)
  {
    shapeBlue -= 2;
  } else
  {
    shapeBlue += 2;
  }

  shapeColor = color(shapeRed, shapeGreen, shapeBlue);

  if (shape)
  {
    fill(shapeColor);
    ellipse(x, y, size, size);
  } else
  {
    fill(shapeColor);
    rect(x, y, size, size);
  }

  if (x > width - 200)
  {
    size = 120;
  } else
  {
    size = 60;
  }

  backgroundColor = 255 - int((y/255) * 110);

  if (x > width - size/2 || x < size/2)
  {
    xVelo = random(1, 10) * (xVelo/abs(xVelo));
    yVelo = random(1, 10) * (yVelo/abs(yVelo));
    xVelo = -xVelo;
    shape = !shape;
      shapeRed = int(random(0, 255));
  shapeGreen = int(random(0, 255));
  shapeBlue = int(random(0, 255));
  shapeRedB = random(1, 3) > 2;
    shapeBlueB = random(1, 3) > 2;
      shapeGreenB = random(1, 3) > 2;
  }
  if (y > height - size/2 || y < size/2)
  {
    xVelo = random(1, 10) * (xVelo/abs(xVelo));
    yVelo = random(1, 10) * (yVelo/abs(yVelo));
    yVelo = -yVelo;
    shape = !shape;
      shapeRed = int(random(0, 255));
  shapeGreen = int(random(0, 255));
  shapeBlue = int(random(0, 255));
    shapeRedB = random(1, 3) > 2;
    shapeBlueB = random(1, 3) > 2;
      shapeGreenB = random(1, 3) > 2;
  }
}
