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
    for(int i = 0; i < pollen.size(); i++) { //i hate this so much
      if(pollen.get(i).y + 12 <= y + h/2 && x - w/2 < pollen.get(i).x && pollen.get(i).x < x + w/2) {
        deathNote.add(pollen.get(i));
        hp--;
      }
    }
    for(int i = 0; i < deathNote.size(); i++) {
       pollen.remove(deathNote.get(i)); 
    }
  }
  
  void move() {
    
  }
  
  void update() {
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
    println(hp);
  }
}
