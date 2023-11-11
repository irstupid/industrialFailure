float mX;
float mY;
int bckColorR;
int bckColorG;
int bckColorB;
float f1;
float f2;
float f3;
float g;
float x;
float y;
float xV;
float yV;

void setup() {
  size(600, 600);
  strokeWeight(10);
  rectMode(CENTER);
}

void draw() {
  if (mY < 300)
  {
    bckColorR = 255;
    bckColorG = 0;
    bckColorB = 0;
  }
  else
  {
    bckColorR = 0;
    bckColorG = 255;
    bckColorB = 0;
  }
  
  strokeWeight(0);
  stroke(0);
  
  fill(bckColorR + 255, bckColorG, bckColorB);
  rect(width/6, height/2, width/3, height);
  fill(bckColorR, bckColorG + 255, bckColorB);
  rect(width/6 * 3, height/2, width/3, height);
  fill(bckColorR, bckColorG, bckColorB + 255);
  rect(width/6 * 5, height/2, width/3, height);

  fill(#00ffff, ((600 - f1)/600) * 255);
  rect(width/6, f1, width/6, width/6, 10);
  f1 += 2;
  if(f1 > 600)
  {
    f1 = 0;
  }
  
  fill(#ff00ff, ((600 - f2)/600) * 255);
  rect(width/6 * 3, f2, width/6, width/6, 10);
  f2 += 4;
  if(f2 > 600)
  {
    f2 = 0;
  }
  
  fill(#ffff00, ((600 - f3)/600) * 255);
  rect(width/6 * 5, f3, width/6, width/6, 10);
  f3 += 3;
  if(f3 > 600)
  {
    f3 = 0;
  }
  
  mX += 5;
  mY += -5;
  if (mX > 600)
  {
    mX = 0;
  }
  if (mY < 0)
  {
    mY = 600;
  }
  
  strokeWeight(10);
  fill(#00ffff);
  ellipse(mX, mY, 150, 150);
  line(mX - 50, mY - 25, mX + 50, mY + 25);
  
  strokeWeight(0);
  if(mouseX > x - 25 && mouseX < x + 25 && mouseY > y - 25 && mouseY < y + 25)
  {
    fill(#00ff00);
  }
  else
  {
    fill(#ffff00);
  }
  ellipse(x, y, 50, 50);
  xV = -(x - mouseX)/10;
  yV = -(y - mouseY)/10;
  x += xV;
  y += yV;
  
  strokeWeight(5);
  stroke(#ffff00);
  fill(#ff00ff, 150);
  rect(width/2, height/2, g, g);
  g += 2;
  if(g > 600)
  {
    g = 0;
  }
  line(width/2 - g/2 + 1, height/2, width/2 + g/2 - 1, height/2);
  stroke(#00ff00);
  line(width/2, height/2 - g/2 + 1, width/2, height/2 + g/2 - 1);
}
