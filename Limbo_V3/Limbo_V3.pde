float s;
float wG;

void setup() {
  size(600, 600);
  rectMode(CENTER);
  s = width/4;
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
  
}
