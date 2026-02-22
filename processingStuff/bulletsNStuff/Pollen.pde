class Pollen {
  final int ANIMATION_SPEED = 2;
  final int SPEED = 10;
  
  PImage[] sprite;
  int a;
  
  float x;
  float y;
  
  Pollen(float x, float y, PImage[] sprite) {
    this.x = x;
    this.y = y;
    this.sprite = sprite;
  }
  
  void draw() {
    push();
      imageMode(CENTER);
      rectMode(CENTER);
      //rect(x, y, 12, 24);
      image(sprite[floor(a/ANIMATION_SPEED)], x, y, 18/*temp*/, 30/*temp*/);
    pop();
    a++;
    if(a >= ANIMATION_SPEED * 4) {
      a = 0;
    }
  }
  
  boolean update() {
    y -= SPEED;
    if(y < -24/*temp*/) {
      return true;
    } else {
      return false;
    }
  }
}
