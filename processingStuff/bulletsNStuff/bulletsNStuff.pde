ScaleFrame scaleFrame;
int state = 2; //0: title 1: menu 2: game

Player player;
ArrayList<Bullet> bullets; //nStuff 
Boss boss;

void setup() {
  noSmooth();
  size(800, 800);
  scaleFrame = new ScaleFrame(800, 800);
  
  player = new Player();
  bullets = new ArrayList<Bullet>();
  bullets.add(new Bullet(0, 0, 45, 25, 8));
  bullets.add(new Bullet(400, 0, 90, 25, 8));
  bullets.add(new Bullet(800, 0, 135, 25, 8));
  bullets.add(new Bullet(800, 400, 180, 25, 8));
  bullets.add(new Bullet(800, 800, -135, 25, 8));
  bullets.add(new Bullet(400, 800, -90, 25, 8));
  bullets.add(new Bullet(0, 800, -45, 25, 8));
  bullets.add(new Bullet(0, 400, 0, 25, 8));
  boss = new Boss();
}

void draw() {
  if(state == 2) {
    if(player.health > 0) {
      player.update();
    }
    player.collide(bullets);
    boss.update();
    boss.collide(player.pollen);
    for(Bullet bullet : bullets) {
      bullet.update();
    }
  }
  
  scaleFrame.transform();
    if(state == 2) {
      background(#00aa00);
      player.draw();
      boss.draw();
      for(Bullet bullet : bullets) {
        bullet.draw();
      }
    }
  scaleFrame.border();
}

void keyPressed() {
  switch(state) {
    case 2:
      player.keyPressed();
    break;
  }
}

void keyReleased() {
  switch(state) {
    case 2:
      player.keyReleased();
    break;
  }
}
