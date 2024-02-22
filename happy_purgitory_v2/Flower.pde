class Flower
{
  float x;
  float y;
  float s;
  float r;
  int pC;
  int cC;
  
  boolean active = false;
  int activeTime = 60;
  boolean done = false;
 
  Flower(float x, float y, float s, float r, int pC, int cC)
  {
    this.x = x;
    this.y = y;
    this.s = s;
    this.r = r;
    this.pC = pC;
    this.cC = cC;
  }
  
  void draw()
  {
    if(active)
    {
      flower(x, y, s, r, pC, cC);
      s += random(-10, 10);
      r += random(-10, 10);
      
      if(dist(x, y, player.x, player.y) <= (s/2) + (s/10) + 25)
      {
        player.health--;
        done = true;
      }
      
      activeTime--;
      if(activeTime <= 0)
      {
        done = true;
      }
    }
    else
    {
      flower(x, y, s, r, #aa0000, #aa0000);
      textSize(s);
      fill(#ffffff);
      text("!", x - (s/6), y + (s/3));
      activeTime--;
      if(activeTime <= 0)
      {
        active = true;
        activeTime = 60;
      }
    }
  }
  
  void flower(float x, float y, float s, float r, int petalColor, int insideColor)
{
  noStroke();
  push();
    translate(x, y);
    rotate(radians(r));
    fill(petalColor, 200);
    ellipse(0 + s/2, 0, s, s);
    ellipse(0 - s/2, 0, s, s);
    ellipse(0, 0 - s/2, s, s);
    ellipse(0, 0 + s/2, s, s);
    fill(insideColor, 200);
    ellipse(0, 0, s, s);
  pop();
}
}
