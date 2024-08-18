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

void setup()
{
  size(800, 800, P2D);
  rectMode(CENTER);
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
  
  player = new Player(width/2, height/2);
  enemys = new ArrayList<Enemy>();
  enemys.add(new Enemy(0, 0, 4));
  carrots = new ArrayList<Carrot>();
  flower = new Flower();
  explosions = new ArrayList<Explosion>();
}

void draw()
{
  image(background, 0, 0);
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

void keyPressed(){player.keyPressed(); flower.keyPressed();}
void keyReleased(){player.keyReleased();}
