ScaleFrame scaleFrame;
Player player;
ArrayList<Bullet> bullets; //nStuff 

void setup() {
  noSmooth();
  size(800, 800);
  scaleFrame = new ScaleFrame(800, 800);
  
  player = new Player();
  bullets = new ArrayList<Bullet>();
  bullets.add(new Bullet(0, 0, 45, 25, 5));
}

void draw() {
  player.update();
  for(Bullet bullet : bullets) {
    bullet.update();
  }
  
  scaleFrame.transform();
    background(#00aa00);
    player.draw();
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
