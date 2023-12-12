PVector player;
float playerDirection;
int animation;
int animationTimer;

FloatList applesX = new FloatList();
FloatList applesY = new FloatList();
FloatList applesS = new FloatList();
FloatList applesR = new FloatList();
int appleAnimation;

int appleCounter;
float totalTime;

int APPLES = 10;
float SPEED = 3;

void setup()
{
  fullScreen();
  rectMode(CENTER);
  textMode(CENTER);
  player = new PVector(width/2, height/2);
  for(int i = 0; i < APPLES; i++)
  {
    applesX.append(random(100, width - 100));
    applesY.append(random(100, height - 100));
    applesS.append(1);
    applesR.append(0);
    appleCounter += 1;
  }
}

void draw()
{
  background(#55eeee);
  playerDirection = atan2(mouseY - player.y, mouseX - player.x);
  munchMan(player.x, player.y, degrees(playerDirection) + 90, animation);
  if(animationTimer == 0)
  {
    if(animation == 1)
    {
      animation = 0;
    }
    else
    {
      animation = 1;
    }
    animationTimer = 10;
  }
  animationTimer--;
  player.add(new PVector(cos(playerDirection), sin(playerDirection)).normalize().mult(SPEED));
  
  for(int i = 0; i < applesX.size(); i++)
  {
    applesS.set(i, 1 - (-abs(appleAnimation/45f - 2) + 2)/7);
    applesR.set(i, -abs(appleAnimation - 90) + 45);
    apple(applesX.get(i), applesY.get(i), applesR.get(i), applesS.get(i));
    if(sqrt(sq(applesX.get(i) - player.x) + sq(applesY.get(i) - player.y)) - 75 < 0)
    {
      applesX.remove(i);
      applesY.remove(i);
      applesS.remove(i);
      applesR.remove(i);
      appleCounter--;
      if(appleCounter == 0)
      {
        totalTime = (millis()/100)/10f;
      }
    }
  }
  appleAnimation++;
  if(appleAnimation > 180)
  {
    appleAnimation = 0;
  }
  
  if(appleCounter == 0)
  {
    fill(#000000);
    push();
    translate(width/2 - 200, height/2);
    scale(10);
    text("you win", 0, 0);
    pop();
    fill(#000000);
    push();
    translate(width/2 - 100, height/2 + 175);
    scale(5);
    text(totalTime, 0, 0);
    pop();
    push();
    translate(width/2 - 100, height/2 + 100);
    scale(5);
    text("it took you", 0, 0);
    pop();
    push();
    translate(width/2 - 100, height/2 + 250);
    scale(5);
    text("seconds", 0, 0);
    pop();
  }
  else
  {
    fill(#000000);
    push();
    translate(0, 100);
    scale(10);
    text("you have", 0, 0);
    pop();
    fill(#000000);
    push();
    translate(500, 100);
    scale(10);
    text(APPLES - appleCounter, 0, 0);
    pop();
    fill(#000000);
    push();
    if(APPLES - appleCounter < 10)
    {
    translate(600, 100);
    scale(10);
    text("apples", 0, 0);
    pop();
    }
    else
    {
    translate(650, 100);
    scale(10);
    text("apples", 0, 0);
    pop();
    }
    
    fill(#000000);
    push();
    translate(width - 400, 100);
    scale(10);
    text(millis()/100, 0, 0);
    pop();
  }
}

void apple(float x, float y, float r, float s)
{
  push();
  fill(#ff0000);
  noStroke();
  translate(x, y);
  rotate(radians(r));
  scale(s);
    push();
    rotate(0.2);
    ellipse(15, 0, 50, 75);
    pop();
    push();
    rotate(-0.2);
    ellipse(-15, 0, 50, 75);
    pop();
  fill(#00aa00);
  ellipse(7, -43, 10, 10);
  fill(#865A08);
  rect(0, -45, 5, 30);
  fill(#ff0000);
  ellipse(0, -30, 50, 20);
  fill(#ff4444);
  ellipse(-20, -20, 20, 20);
  pop();
}

void munchMan(float x, float y, float r, int a)
{
  push();
  translate(x, y);
  rotate(radians(r));
  fill(#ffff00);
  if(a == 1)
  {
  arc(0, 0, 100, 100, -1, PI+QUARTER_PI, PIE);
  }
  else
  {
    ellipse(0, 0, 100, 100);
    line(0, 0, 0, -50);
  }
  pop();
}
