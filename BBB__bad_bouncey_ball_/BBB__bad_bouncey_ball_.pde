float x; 
float y;
float xVelo; 
float yVelo;

void setup() {
  size(800,600);
  x = 0;
  y = 100;
  xVelo = 5;
  yVelo = 5;
}

void draw() {
  background(#226644);
  x = x + xVelo;
  y = y + yVelo;
  ellipse(x, y, 60, 60);
  //if(x > width || x < 0)
  //{
  //  //xVelo = -xVelo
  //}
    if(y > height - 30 || y < 30)
  {
    yVelo = -yVelo;
  }
  if(x > width)
  {
    x = 0;
  }
  if(x < 0)
  {
    x = width;
  }
  //if(y > height)
  //{
  //  y = 0;
  //}
  //if(y < 0)
  //{
  //  y = height;
  //}
}
