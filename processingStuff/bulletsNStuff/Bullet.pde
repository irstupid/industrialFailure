//fuck it im lazy lets make some quick, simple, dirty inheritance that im sure wont come back to bite me later :)
class Bullet {
  PImage[] sprite;
  
  float x;
  float y;
  float w; //size
  float r; //in degrees
  float s; //speed
  
  Bullet(float x, float y, float r, float w, float s) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.r = r;
    this.s = s;
    loadSprite();
  }
  
  void loadSprite() {
    sprite = new PImage[1];
    sprite[0] = loadImage("bullet.png");
  }
  
  void update() {
    x += cos(radians(r)) * s;
    y += sin(radians(r)) * s;
  }
  
  void draw() {
    push();
      translate(x, y);
      imageMode(CENTER);
      image(sprite[0], x, y, w, w);
    pop();
  }
  
  float distance(float pX, float pY) {
    return dist(pX, pY, x, y) + w/2;
  }
}
