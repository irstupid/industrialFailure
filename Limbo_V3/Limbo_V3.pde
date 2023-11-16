float s;
float wG;
float bpX;
float bpY;
float bpS;

void setup() {
  size(600, 600);
  rectMode(CENTER);
  s = width/4;
  bpX = 100;
  bpY = height - 40;
}

void draw() {
  background(80);
  
  strokeWeight(0);
  stroke(0);
  fill(#ff0000, 200);
  rect(width/2, height/2, wG, wG);
  fill(#00ff00, 125);
  ellipse(width/2, height/2, width - wG, width - wG);
  strokeWeight(5);
  if(wG > width/2)
  {
    line(width/2, height/2, width/2, wG);
  }
  else
  {
    line(width/2, height/2, width/2, height/2);
  }
  
  wG += 2;
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
  
  stroke(0);
  strokeWeight(0);
  fill(#B27B32);
  ellipse(bpX, bpY, 80, 80);
}
