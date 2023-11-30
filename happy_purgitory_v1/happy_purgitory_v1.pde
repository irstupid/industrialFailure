float flowersX[];
float flowersY[];
float flowersS[];
float flowersR[];
int flowersPC[];
int flowersIC[];

IntList cookiesType = new IntList();
FloatList cookiesX = new FloatList();
FloatList cookiesY = new FloatList();
FloatList cookiesR = new FloatList();
FloatList cookiesS = new FloatList();
FloatList cookiesSP = new FloatList();

float noiseX;
float noiseY;

void setup()
{
  size(800, 800, P2D);

  flowersX = new float[50];
  flowersY = new float[50];
  flowersS = new float[50];
  flowersR = new float[50];
  flowersIC = new int[50];
  flowersPC = new int[50];

  for (int i = 0; i < 50; i++)
  {
    flowersX[i] = random(0, 800);
    flowersY[i] = random(0, 800);
    flowersS[i] = random(1, 100);
    flowersR[i] = random(0, 90);
    flowersPC[i] = color(random(0, 255), random(0, 255), random(0, 255));
    flowersIC[i] = color(random(0, 255), random(0, 255), random(0, 255));
  }

  for (int i = 0; i < 25; i++)
  {
    newCookie();
  }
  
  noiseX = random(0, 1000);
  noiseY = random(0, 1000);
  
  rectMode(CENTER);
}

void draw()
{
  background(90);
  
  noiseX += 0.05 * (mouseX - 400)/100;
  noiseY += 0.05 * (mouseY - 400)/100;

  
  for(int x = 0; x < 100; x++)
  {
    for(float y = 0; y < 100; y++)
    {
      noStroke();
      fill(noise(x * 0.03 + noiseX, y * 0.03 + noiseY) * 255);
      rect(x * 8, y * 8, 8, 8);
    }
  }


  for (int i = 0; i < 50; i++)
  {
    flower(flowersX[i], flowersY[i], flowersS[i], flowersR[i], flowersPC[i], flowersIC[i]);
    flowersX[i] += -1 * (mouseX - 400)/100;
    flowersY[i] += -1 * (mouseY - 400)/100;
    flowersS[i] += random(-10, 10);
    flowersR[i] += random(-10, 10);
  }

  for (int i = 0; i < cookiesX.size(); i++)
  {
    cookie(cookiesX.get(i), cookiesY.get(i), cookiesS.get(i), cookiesR.get(i), cookiesType.get(i));
    cookiesX.set(i, cookiesX.get(i) + cookiesSP.get(i));
    cookiesR.set(i, cookiesR.get(i) + 2);
    
    cookiesX.set(i, cookiesX.get(i) + -0.5 * (mouseX - 400)/100);
    cookiesY.set(i, cookiesY.get(i) + -0.5 * (mouseY - 400)/100);

    if (cookiesX.get(i) > 800 + cookiesS.get(i) || cookiesY.get(i) > 800 + cookiesS.get(i) || cookiesX.get(i) < 0 - cookiesS.get(i) || cookiesY.get(i) < 0 - cookiesS.get(i))
    {
      deleteCookie(i);
    }
  }

  for (int i = 0; i < 50; i++)
  {
    if (random(0, 10) < 1)
    {
      flowersX[i] = random(0, 800);
      flowersY[i] = random(0, 800);
      flowersS[i] = random(1, 100);
      flowersR[i] = random(0, 90);
      flowersPC[i] = color(random(0, 255), random(0, 255), random(0, 255));
      flowersIC[i] = color(random(0, 255), random(0, 255), random(0, 255));
    }
  }

  //cookie(width/2, width/2, 100, 0, 3);
}

void shitFlower(float x, float y, int c)
{
  fill(c);
  noStroke();
  ellipse(x-5, y-5, 20, 20);
  ellipse(x+5, y-5, 20, 20);
  ellipse(x+5, y, 20, 20);
  ellipse(x, y+5, 20, 20);
}

void flower(float x, float y, float s, float r, int petalColor, int insideColor)
{
  noStroke();
  push();
  translate(x, y);
  rotate(radians(r));
  fill(petalColor, 200);
  ellipse(0 + s/2, 0, s, s);
  ellipse(0 - s/2, 0, s, s);
  ellipse(0, 0 - s/2, s, s);
  ellipse(0, 0 + s/2, s, s);
  fill(insideColor, 200);
  ellipse(0, 0, s, s);
  pop();
}

void cookie(float x, float y, float s, float r, int type)
{
  push();
  translate(x, y);
  rotate(radians(r));
  scale(s/100);
  if (type == 1)
  {
    fill(#DEB06B);
    ellipse(0, 0, 100, 100);
    fill(#673B17);
    ellipse(25, 0, 20, 20);
    ellipse(-10, 10, 20, 20);
    ellipse(25, 25, 10, 10);
    ellipse(-20, -20, 10, 10);
    ellipse(10, -20, 15, 15);
    ellipse(-30, 0, 10, 10);
    ellipse(0, 30, 10, 10);
    ellipse(-5, -35, 5, 5);
    ellipse(30, -20, 5, 5);
    ellipse(-25, 25, 5, 5);
  } 
  else if (type == 2)
  {
    fill(#FAD59C);
    ellipse(0, 0, 100, 100);
    fill(#FFA2E8);
    ellipse(0, 0, 80, 80);
    push();
    fill(#ff0000);
    translate(20, 5);
    rotate(radians(90));
    ellipse(0, 0, 10, 4);
    pop();
    push();
    fill(#ffff00);
    translate(-20, 10);
    rotate(radians(10));
    ellipse(0, 0, 10, 4);
    pop();
    push();
    fill(#0000ff);
    translate(-7, -22);
    rotate(radians(45));
    ellipse(0, 0, 10, 4);
    pop();
    push();
    fill(#00ffff);
    translate(20, -20);
    rotate(radians(-30));
    ellipse(0, 0, 10, 4);
    pop();
    push();
    fill(#00ff00);
    translate(0, 25);
    rotate(radians(0));
    ellipse(0, 0, 10, 4);
    pop();
    push();
    fill(#ff00ff);
    translate(0, 0);
    rotate(radians(-120));
    ellipse(0, 0, 10, 4);
    pop();
    push();
    fill(#FF7403);
    translate(-20, -7);
    rotate(radians(-10));
    ellipse(0, 0, 10, 4);
    pop();
  } 
  else
  {
    fill(#AD6E3B);
    ellipse(0, 0, 100, 100);
  }
  pop();
}

void newCookie()
{
  cookiesS.append(random(25, 100));
  cookiesX.append(0 - cookiesS.get(cookiesS.size() - 1));
  cookiesY.append(random(0 - cookiesS.get(cookiesS.size() - 1), 800 + cookiesS.get(cookiesS.size() - 1)));
  cookiesR.append(0);
  cookiesType.append(int(random(3)));
  cookiesSP.append(random(1, 5));
}

void deleteCookie(int culprit)
{
  cookiesX.remove(culprit);
  cookiesY.remove(culprit);
  cookiesS.remove(culprit);
  cookiesR.remove(culprit);
  cookiesType.remove(culprit);
  cookiesSP.remove(culprit);

  newCookie();
}
