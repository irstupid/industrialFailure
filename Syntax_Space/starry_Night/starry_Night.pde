float sunY;
float darkness;
float[] starsX;
float[] starsY;
PImage staryNight;
float staryNightA;

void setup() {
  size(800, 600);
  noStroke();
  sunY = 150;
  darkness = 0;
  starsX = new float[50];
  starsY = new float[50];
     int i = 0;
    while(i < 50)
  {
    starsX[i] = random(0, 800);
    starsY[i] = random(0, 400);
    i++;
  }
  staryNight = loadImage("starryNight.jpg");
}

void draw() {
  background(#B1E7F7);
  sunY += 1;
  if(sunY > 400 && darkness <= 200)
  {
    darkness += 1;
  }
  if(sunY > 700)
  {
    staryNightA++;
  }
  
  fill(#ffff00);
  ellipse(400, sunY, 80, 80);
  
  fill(#89BF85);
  ellipse(600, 780, 1600, 700);
  fill(#6EAA69);
  ellipse(-20, 800, 1400, 800);
  fill(#559050);
  ellipse(800, 800, 1200, 800);
  
  fill(#000000, darkness);
  rect(0, 0, width, height);
  
   int i = 0;
  while(i < 50)
  {
    strokeWeight(0);
    fill(#ffffff, darkness - 50);
    ellipse(starsX[i], starsY[i], 5, 5);
    i++;
  }
  tint(255, staryNightA);
  image(staryNight, 0, 0);
}
