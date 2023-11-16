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
float s;
float wG;
float bpX;
float bpY;
float bpS;

void setup() {
  size(600, 600);
  strokeWeight(10);
  rectMode(CENTER);
  s = width/4;
  bpX = 100;
  bpY = height - 40;
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
  if (mX > width)
  {
    mX = 0;
  }
  if (mY < 0)
  {
    mY = height;
  }
  
  strokeWeight(10);
  fill(#00ffff);
  ellipse(mX, mY, 150, 150);
  line(mX - 50, mY - 25, mX + 50, mY + 25);
    
  stroke(0);
  strokeWeight(0);
  fill(#B27B32);
  ellipse(bpX, bpY, 80, 80);
  
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
  if(g > width)
  {
    g = 0;
  }
  line(width/2 - g/2 + 1, height/2, width/2 + g/2 - 1, height/2);
  stroke(#00ff00);
  line(width/2, height/2 - g/2 + 1, width/2, height/2 + g/2 - 1);
  
   strokeWeight(0);
  stroke(0);
  fill(#ff0000, 200);
  rect(width/2, height/2, wG, wG);
  fill(#00ff00, 125);
  ellipse(width/2, height/2, width - wG, width - wG);
  strokeWeight(5);
  stroke(30, 100);
  if(wG > width/2)
  {
    line(width/2, height/2, width/2, wG);
  }
  else
  {
    line(width/2, height/2, width/2, height/2);
  }
  
  wG += 3;
  if(wG >= width)
  {
     wG = 0;
  }
  
  strokeWeight(5);
  stroke(255);
  line(0, height/2, width, height/2 + s);
  line(0, height/2, width, height/2 - s);
  s += 1;
  if(s > height/2)
  {
    s = 0;
  }
  
  if(bpS == 0)
  {
    bpX -= 2;
  }
  else if(bpS == 1)
  {
    bpY -= 2;
  }
  else if(bpS == 2)
  {
    bpX += 2;
  }
  else
  {
    bpY += 2;
  }
  
  if(bpX < 40)
  {
    bpX = 40;
    bpS = 1;
  }
  if(bpY < 40)
  {
    bpY = 40;
    bpS = 2;
  }
  if(bpX > width - 40)
  {
    bpX = width - 40;
    bpS = 3;
  }
  if(bpY > height - 40)
  {
    bpY = height - 40;
    bpS = 0;
  }
}
