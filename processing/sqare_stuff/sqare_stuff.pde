float x; 
float y;
float Velo; 
float sX;
float sY;
float s;
int bounces;
int sizeDirection;
int c;
int direction;

void setup() {
  size(800,600);
  rectMode(CENTER);
  x = width/2;
  y = height/2;
  Velo = 5;
  bounces = 0;
  c = #884422;
  sX = 90;
    sY = 90;
  sizeDirection = 1;
  s = 0;
  direction = 0;
}

void draw() {
  background(#226644);
  fill(c);
  rect(x, y, sX, sY);
  if(direction == 1)
  {
    y += Velo;
    sY = s;
    sX = 90;
  }
  else
  {
    x += Velo;
        sX = s;
    sY = 90;
  }
  
  s += sizeDirection;
  
  if(s >= 100)
  {
    sizeDirection = -1;
  }
  else if(s <= 0)
  {
    sizeDirection = 1;
  }
  
  //exersize 1
  if (x > width || x < 0) {
    x = constrain(x, 0, width);
    Velo = -Velo;
    bounces++;
  }
  
    if (y > height || y < 0) {
    y = constrain(y, 0, width);
    Velo = -Velo;
    bounces++;
  }
  
  if(bounces >= 7)
  {
    c = #B91616;
  }
  if(bounces == 4 || bounces == 9 || bounces == 14)
  {
    if(direction == 1)
    {
      direction = 0;
      y = random(0, height);
    }
    else
    {
      direction = 1;
      x = random(0, width);
    }
    bounces++;
  }
  if(bounces >= 14)
  {
      c = #884422;
      bounces = 0;
  }
  
  println(s);
}
