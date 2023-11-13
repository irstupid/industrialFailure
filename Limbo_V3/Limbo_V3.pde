float s;
float wG;

void setup() {
  size(600, 600);
  rectMode(CENTER);
}

void draw() {
  background(80);
  
  strokeWeight(0);
  stroke(0);
  fill(#ff0000);
  ellipse(width/2, height/2, width - wG, width - wG);
  rect(width/2, height/2, wG, wG);
  
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
