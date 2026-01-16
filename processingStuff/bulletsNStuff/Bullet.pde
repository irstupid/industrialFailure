//fuck it im lazy lets make some quick, simple, dirty inheritance that im sure wont come back to bite me later :)
class Bullet {
  float x;
  float y;
  float w;
  float r; //in degrees
  float s;
  
  Bullet(float x, float y, float r, float w, float s) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.r = r;
    this.s = s;
  }
  
  void update() {
    x += cos(radians(r)) * s;
    y += sin(radians(r)) * s;
  }
  
  void draw() {
    ellipse(x, y, w, w);
  }
  
  float distance(float pX, float pY) {
    return dist(pX, pY, x, y);
  }
}
