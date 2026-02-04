class Boss {
  final int WAIT_TIME = 30;
  final int HP = 0;
  final int WIDTH = 200;
  final int HEIGHT = 200;
  
  
  int hp = HP;
  int x;
  int y;
  int w = WIDTH;
  int h = HEIGHT;
  
  Runnable[] attacks;
  Runnable attack;
  int time = 0;
  boolean attacking = false;
  boolean dead = false;
  
  Boss() {
    
  }
  
  void draw() {
    push();
      rectMode(CENTER);
      rect(x, y, w, h);
    pop();
  }
  
  void update() {
    time++;
    if(!attacking) {
      if(time >= WAIT_TIME) {
        attack = attacks[floor(random(0, attacks.length))];
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
