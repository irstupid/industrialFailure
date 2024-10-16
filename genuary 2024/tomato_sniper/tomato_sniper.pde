ArrayList<Tomato> tomatos;
Roomba roomba;
Shoot shoot;
ArrayList<Splat> splats;
int spawnTime;
int difficulty = 120;
int score;
int state = 2;
int[] scoreColors;
KeyPad keyPad;

PImage splat;
PImage tomato;
PImage background;

void setup()
{
  splat = loadImage("splat.png");
  splat.resize(0, 400);
  tomato = loadImage("tomato.png");
  background = loadImage("concrete.jpeg");
  textFont(createFont("bubble.ttf", 128));
  
  size(800, 800, P2D);
  //fullScreen(P2D);
  background.resize(width, height);
  colorMode(HSB);
  
  tomatos = new ArrayList<Tomato>();
  roomba = new Roomba(width/2, height/2);
  shoot = new Shoot();
  splats = new ArrayList<Splat>();
  scoreColors = new int[3];
  keyPad = new KeyPad();
  for(int i = 0; i < scoreColors.length; i++)
  {
    scoreColors[i] = color(random(0, 255), 255, 255);
  }
}

void draw()
{
  image(background, 0, 0);
  for(int i = 0; i < splats.size(); i++)
  {
    splats.get(i).draw();
  }
  
  if(state == 0)
  {
    for(int i = 0; i < tomatos.size(); i++)
    {
      tomatos.get(i).targetX = roomba.x;
      tomatos.get(i).targetY = roomba.y;
      tomatos.get(i).draw();
    }
    roomba.stop = shoot.active;
    roomba.draw();
    shoot.draw();
    spawnTomato();
    hit();
    fill(scoreColors[0]);
    text(str(score).charAt(0), width/2 - str(score).length() * 45, 110);
    if(str(score).length() >= 2)
    {
      fill(scoreColors[1]);
      text(str(score).charAt(1), width/2 - (str(score).length() - 1.5) * 45, 110);
    }
    if(str(score).length() >= 3)
    {
      fill(scoreColors[2]);
      text(str(score).charAt(2), width/2 - (str(score).length() - 3) * 45, 110);
    }
  }
  else if(state == 2)
  {
    keyPad.draw();
  }
  else if(state == 1)
  {
    roomba.draw();
  }
}

void hit()
{
  for(int i = 0; i < tomatos.size(); i++)
  {
    if(dist(tomatos.get(i).x, tomatos.get(i).y, roomba.x, roomba.y) <= 75)
    {
      if(state == 1)
      {
        state = 1;
        for(int j = 0; j < 10; j++)
        {
          splats.add(new Splat(random(0, width), random(0, height), 1, false));
        }
        roomba = new Roomba(width/2, height/2);
      }
      else
      {
        state = 2;
        keyPad = new KeyPad();
      }
    }
  }
}

void spawnTomato()
{
  spawnTime--;
  if(spawnTime <= 0)
  {
    spawnTime = difficulty;
    if(difficulty > 50)
    {
      difficulty -= (difficulty > 100 ? 5 : 1);
    }
    if(random(0, 1) > 0.5)
    {
      if(random(0, 1) > 0.5)
      {
        tomatos.add(new Tomato(color(random(0, 255), 255, 255), color(random(0, 255), 255, 255), random(0, width), height + 80));
      }
      else
      {
        tomatos.add(new Tomato(color(random(0, 255), 255, 255), color(random(0, 255), 255, 255), random(0, width), -80));
      }
    }
    else
    {
      if(random(0, 1) > 0.5)
      {
        tomatos.add(new Tomato(color(random(0, 255), 255, 255), color(random(0, 255), 255, 255), width + 80, random(0, height)));
      }
      else
      {
        tomatos.add(new Tomato(color(random(0, 255), 255, 255), color(random(0, 255), 255, 255), -80, random(0, height)));
      }
    }
  }
}

void keyPressed()
{
  if(state == 0)
  {
    roomba.keyPressed();
    shoot.keyPressed();
    if(key == ' ')
    {
      shoot.x = roomba.x;
      shoot.y = roomba.y;
      shoot.active = true;
    }
  }
}

void keyReleased()
{
  if(state == 0)
  {
    roomba.keyReleased();
    shoot.keyReleased();
    if(key == ' ')
    {
      shoot.active = false;
      ellipse(shoot.x, shoot.y, 5, 5);
    }
  }
}

//void tomato(float x, float y, float r, int tc, int lc)
//{
//  push();
//    rotate(radians(r));
//    translate(x, y);
//    noStroke();
//    rectMode(CENTER);
//    fill(tc);
//    ellipse(0, 0, 120, 100);
//    fill(lc);
//    rect(0, -55, 10, 20);
//    push();
//      rotate(radians(30));
//      translate(-17, 4);
//      triangle(5, -47, -5, -47, 0, -65);
//    pop();
//    push();
//      rotate(radians(-30));
//      translate(17, 4);
//      triangle(5, -47, -5, -47, 0, -65);
//    pop();
    
//  pop();
//}
