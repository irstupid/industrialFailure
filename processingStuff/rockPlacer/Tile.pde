class Tile
{
  int x;
  int y;
  int sX;
  int sY;
  int n;
  int animation;
  int shrink;
  
  Tile(int x, int y)
  {
    this.x = x;
    this.y = y;
    this.sX = 100 * x;
    this.sY = 100 * y;
    n = 0;
  }
  
  void draw()
  {
    if(n == 5)
    {
      n = 5;
      animation++;
    }
    if(n > 5)
    {
      animation = 90;
      shrink++;
    }
    if(shrink > 30)
    {
      n = 0;
      animation = 0;
      shrink = 0;
    }
    push();
      translate(sX, sY);
      fill(230);
      stroke(#999999);
      rect(0, 0, 100, 100);
      
      noStroke();
      fill(50);
      if(animation <= 60)
      {
        push();
          translate(50, 50);
          scale(1f - (max(animation, 50f) - 50f)/10);
          rotate((max(animation, 25f) - 25f) * TWO_PI/50f);
          switch(n)
          {
            case 5:
              circle(0, 0, 20);
            case 4:
              circle(30 - min(animation, 35)/2, 30 - min(animation, 35)/2, 20);
            case 3:
              circle(-30 + min(animation, 35)/2, 30 - min(animation, 35)/2, 20);
            case 2:
              circle(30 - min(animation, 35)/2, -30 + min(animation, 35)/2, 20);
            case 1:
              circle(-30 + min(animation, 35)/2, -30 + min(animation, 35)/2, 20);
            
          }
        pop();
      }
      if(animation >= 50)
      {
        push();
          translate(50, 50);
          scale(0 + (constrain(animation, 50f, 70f) - 50f)/20 - shrink/30f);
          rotate((constrain(animation, 25f, 87.5f) - 25f) * TWO_PI/50f);
          star();
        pop();
      }
    pop();
  }
  
  void add()
  {
    n++;
  }
  
  void star()
  {
    rotate(radians(45));
    beginShape();
      vertex(0, 50);
      vertex(10, 10);
      vertex(50, 0);
      vertex(10, -10);
      vertex(0, -50);
      vertex(-10, -10);
      vertex(-50, 0);
      vertex(-10, 10);
    endShape();
  }
}
