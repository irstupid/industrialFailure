class Boss {
  final int WAIT_TIME = 30;
  final int HP = 0;
  final int WIDTH = 200;
  final int HEIGHT = 200;
  
  PImage[] sprites;
  int a;
  
  int hp = HP;
  int x;
  int y;
  int w = WIDTH;
  int h = HEIGHT;
  
  Runnable[] attacks = new Runnable[1];
  Runnable attack;
  int time = 0;
  boolean attacking = false;
  boolean dead = false;
  
  Boss() {
    x = width/2;
    y = 100;
    attacks[0] = () -> {};
    hp = 1000;
  }
  
  void draw() {
    push();
      rectMode(CENTER);
      rect(x, y, w, h);
    pop();
  }
  
  void collide(ArrayList<Pollen> pollen) {
    ArrayList<Pollen> deathNote = new ArrayList<Pollen>();
    for(Pollen p : pollen) { //i hate this so much
      if(p.y + 12 <= y + h/2 && x - w/2 < p.x && p.x < x + w/2) {
        deathNote.add(p);
        hp--;
      }
    }
    for(Pollen p : deathNote) {
       pollen.remove(p); 
    }
  }
  
  void move() {
    
  }
  
  void update() {
    if(hp <= 0) {
      dead = true;
    }
    time++;
    if(!attacking) {
      move();
      if(time >= WAIT_TIME) {
        attack = attacks[floor(random(0, attacks.length))];
        attacking = true;
        time = 0;
      }
    }
    else {
      attack.run();
      if(!attacking) {
        time = 0;
      }
    }
  }
}
