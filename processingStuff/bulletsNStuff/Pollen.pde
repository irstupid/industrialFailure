class Pollen {
  final int ANIMATION_SPEED = 2;
  final int SPEED = 10;
  
  PImage[] sprites;
  int a;
  
  float x;
  float y;
  
  Pollen(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void draw() {
    push();
      imageMode(CENTER);
      rectMode(CENTER);
      rect(x, y, 12, 24);
      //image(sprites[floor(a/ANIMATION_SPEED)], x, y, 12/*temp*/, 24/*temp*/);
    pop();
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
