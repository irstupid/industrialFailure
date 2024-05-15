class Ore
{
  int type;
  int x;
  int y;
  
  Ore(int x, int y, int type)
  {
    this.x = x;
    this.y = y;
    this.type = type;
  }
  
  void draw()
  {
    push();
      rectMode(CORNER);
      noStroke();
      colorMode(HSB);
      fill(color(type * (255/3), 255, 255));
      rect(x * scale, y * scale, scale, scale);
    pop();
  }
}
