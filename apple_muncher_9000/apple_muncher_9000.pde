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

int APPLES = 100;
float SPEED = 3;

void setup()
{
  size(800, 800);
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
