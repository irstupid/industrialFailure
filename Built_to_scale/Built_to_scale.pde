import processing.sound.*;

Player player;
PImage background;
PImage[] enemyTypes;
ArrayList<Enemy> enemys;
ArrayList<Carrot> carrots;
PImage heart;
PImage carrot;
PImage puff;
Flower flower;
ArrayList<Explosion> explosions;
int spawnTime;
int difficulty;
int gameState = 2;
PImage instructions;
PImage title;

SoundFile pew;
SoundFile boom;
SoundFile dash;
SoundFile hurt;
SoundFile lose;
SoundFile ponk;
SoundFile poof;
SoundFile music;

boolean ARCADE = true;

void setup()
{
  fullScreen(P2D);
  //rectMode(CENTER);
  enemyTypes = new PImage[6];
  enemyTypes[0] = loadImage("red.png");
  enemyTypes[1] = loadImage("orange.png");
  enemyTypes[2] = loadImage("yellow.png");
  enemyTypes[3] = loadImage("green.png");
  enemyTypes[4] = loadImage("blue.png");
  enemyTypes[5] = loadImage("purple.png");
  background = loadImage("grass.png");
  heart = loadImage("heart.png");
  heart.resize(400, 400);
  carrot = loadImage("carrot.png");
  puff = loadImage("puff.png");
  puff.resize(200, 200);
  if(!ARCADE)
  {
    instructions = loadImage("instructions.png");
    title = loadImage("title.png");
  }
  else
  {
    instructions = loadImage("instructionsARCADE.png");
    title = loadImage("titleARCADE.png");
  }
  
  pew = new SoundFile(this, "pew");
  boom = new SoundFile(this, "boom");
  dash = new SoundFile(this, "dash");
  hurt = new SoundFile(this, "hurt");
  lose = new SoundFile(this, "lose");
  lose.amp(10);
  ponk = new SoundFile(this, "ponk");
  poof = new SoundFile(this, "poof");
  music = new SoundFile(this, "garden banger.wav");
  
  player = new Player(width/2, height/2);
  enemys = new ArrayList<Enemy>();
  //enemys.add(new Enemy(width, height, 4));
  carrots = new ArrayList<Carrot>();
  flower = new Flower();
  explosions = new ArrayList<Explosion>();
  difficulty = 240;
  spawnTime = 0;
}

void draw()
{
  push();
  translate((width - (800f * (height/800f)))/2f, 0);
  scale(height/800f);
  if(!music.isPlaying())
  {
    music.play();
  }
  
  if(gameState == 0)
  {
    spawnTime--;
    if(spawnTime <= 0)
    {
      enemySpawn();
      difficulty = round(difficulty/1.05);
      spawnTime = difficulty;
    }
  }
  push();
    tint(#ffffff, 100);
    image(background, 0, 0);
  pop();
  if(gameState == 0 || gameState == 1)
  {
    flower.draw();
    player.draw();
    for(int i = 0; i < enemys.size(); i++)
    {
      enemys.get(i).draw();
    }
    for(int i = 0; i < carrots.size(); i++)
    {
      carrots.get(i).draw();
    }
    for(int i = 0; i < explosions.size(); i++)
    {
      explosions.get(i).draw();
    }
    if(player.health > 0){image(heart, 410, -10);}
    if(player.health > 1){image(heart, 350, -10);}
    if(player.health > 2){image(heart, 290, -10);}
  }
  else if(gameState == 2)
  {
    image(title, 0, 0);
  }
  else
  {
    image(instructions, 0, 0);
  }
  pop();
  fill(0);
  rect(0, 0, (width - (800f * (height/800f)))/2f, height);
  rect((width - (800f * (height/800f)))/2f + height, 0, (width - (800f * (height/800f)))/2f, height);
}

void enemySpawn()
{
  if(random(0, 2) > 1)
  {
    if(random(0, 2) > 1)
    {
      enemys.add(new Enemy(-250, random(0, 800), floor(random(0, 6))));
    }
    else
    {
      enemys.add(new Enemy(800 + 250, random(0, 800), floor(random(0, 6))));
    }
  }
  else
  {
    if(random(0, 2) > 1)
    {
      enemys.add(new Enemy(random(0, 800), -250, floor(random(0, 6))));
    }
    else
    {
      enemys.add(new Enemy(random(0, 800), 800 + 250, floor(random(0, 6))));
    }
  }
}

void keyPressed()
{
  if(gameState == 0)
  {
    player.keyPressed(); 
    flower.keyPressed();
  }
  else if((gameState == 2 || gameState == 3) && key == 'z')
  {
    gameState = 0;
    player = new Player(400, 400);
    enemys = new ArrayList<Enemy>();
    //enemys.add(new Enemy(width, height, 4));
    carrots = new ArrayList<Carrot>();
    flower = new Flower();
    explosions = new ArrayList<Explosion>();
    difficulty = 240;
    spawnTime = difficulty;
  }
  else if(gameState == 2 && key == '1')
  {
    gameState = 3;
  }
}
void keyReleased()
{
  if(gameState == 0)
  {
    player.keyReleased();
  }
}
