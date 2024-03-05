import gifAnimation.*;

Button button1 = new Button(200, 200);
Button button2 = new Button(600, 200);
Button button3 = new Button(200, 600);
Button button4 = new Button(600, 600);

int clickReset = 60;
int numbA = 255;

int state = 0;

Gif discoBall = null;
float discoBallY = -320;

int screenDark = 305;

int tintColor;
int colorChange = 15;
LenseFlare flare1 = null;
LenseFlare flare2 = null;
LenseFlare flare3 = null;
LenseFlare flare4 = null;

void setup()
{
  size(800, 800);
  discoBall = new Gif(this, "Discoball.gif");
  discoBall.play();
  flare1 = new LenseFlare();
  flare2 = new LenseFlare();
  flare3 = new LenseFlare();
  flare4 = new LenseFlare();
}

void draw()
{
  background(#ffffff);
  
  if(state == 1)
  {
    button1.c = -1;
    button2.c = -1;
    button3.c = -1;
    button4.c = -1;
  }
  
  button1.draw();
  button2.draw();
  button3.draw();
  button4.draw();
  
  textSize(300);
  fill(#000000, numbA);
  text("4", 125, 300);
  text("2", 525, 300);
  text("1", 125, 700);
  text("3", 525, 700);
  numbA -= 10;
  
  if(state == 1)
  {
    tint(0);
  }
  else
  {
    tint(255);
  }
  image(discoBall, width/2 - 140, discoBallY);
  if(state == 1)
  {
    discoBallY += 1.1;
    if(discoBallY >= 0)
    {
      discoBallY = 0;
      state = 2;
      tintColor = color(random(0, 1) * 255, random(0, 1) * 255, random(0, 1) * 255);
      button1.c = 0;
      button2.c = 0;
      button3.c = 0;
      button4.c = 0;
    }
  }
  
  if(state == 2)
  {
    flare1.draw();
    flare2.draw();
    flare3.draw();
    flare4.draw();
  }
  
  if(state == 1)
  {
    fill(#000000, screenDark);
    rect(0, 0, width, height);
    screenDark -= 3;
    if(screenDark <= 0)
    {
      screenDark = 305;
    }
  }
  if(state == 2)
  {
    fill(tintColor, 50);
    rect(0, 0, width, height);
    colorChange--;
    if(colorChange <= 0)
    {
      colorChange = 15;
      tintColor = color(random(0, 1) * 255, random(0, 1) * 255, random(0, 1) * 255);
    }
  }
  
  clickReset--;
  if(button1.timesClicked == 4 && button2.timesClicked == 2 && button3.timesClicked == 1 && button4.timesClicked == 3 && state == 0)
  {
    print("disco");
    state = 1;
  }
}

void mouseClicked()
{
  clickReset = 60;
  button1.click();
  button2.click();
  button3.click();
  button4.click();
}
