ScaleFrame scaleFrame;
Player player;
ArrayList<Bullet> bullets; //nStuff 
Boss boss;

void setup() {
  noSmooth();
  size(800, 800);
  scaleFrame = new ScaleFrame(800, 800);
  
  player = new Player();
  bullets = new ArrayList<Bullet>();
  bullets.add(new Bullet(0, 0, 45, 25, 5));
  boss = new Boss();
}

void draw() {
  player.update();
  boss.update();
  boss.collide(player.pollen);
  for(Bullet bullet : bullets) {
    bullet.update();
  }
  
  scaleFrame.transform();
    background(#00aa00);
    player.draw();
    boss.draw();
    for(Bullet bullet : bullets) {
      bullet.draw();
    }
  scaleFrame.border();
}

void keyPressed() {
  player.keyPressed();
}

void keyReleased() {
  player.keyReleased();
}
