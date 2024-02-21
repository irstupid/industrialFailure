class Cookie
{
  float x;
  float y;
  float speed;
  float s;
  float r;
  int type;
  
  boolean done = false;
  
  Cookie(float y, float speed, float s)
  {
    this.y = y;
    x = -(s/2);
    this.speed = speed;
    this.s = s;
    r = 0;
    type = int(random(1, 3));
  }
  
  void draw()
  {
    x += speed;
    r += 2;
    
    cookie(x, y, s, r, type);
    
    if(x > width + (s/2))
    {
      done = true;
    }
  }
  
  void cookie(float x, float y, float s, float r, int type)
  {
    push();
    translate(x, y);
    rotate(radians(r));
    scale(s/100);
    if (type == 1)
    {
      fill(#DEB06B);
      ellipse(0, 0, 100, 100);
      fill(#673B17);
      ellipse(25, 0, 20, 20);
      ellipse(-10, 10, 20, 20);
      ellipse(25, 25, 10, 10);
      ellipse(-20, -20, 10, 10);
      ellipse(10, -20, 15, 15);
      ellipse(-30, 0, 10, 10);
      ellipse(0, 30, 10, 10);
      ellipse(-5, -35, 5, 5);
      ellipse(30, -20, 5, 5);
      ellipse(-25, 25, 5, 5);
    } 
    else if (type == 2)
    {
      fill(#FAD59C);
      ellipse(0, 0, 100, 100);
      fill(#FFA2E8);
      ellipse(0, 0, 80, 80);
      push();
      fill(#ff0000);
      translate(20, 5);
      rotate(radians(90));
      ellipse(0, 0, 10, 4);
      pop();
      push();
      fill(#ffff00);
      translate(-20, 10);
      rotate(radians(10));
      ellipse(0, 0, 10, 4);
      pop();
      push();
      fill(#0000ff);
      translate(-7, -22);
      rotate(radians(45));
      ellipse(0, 0, 10, 4);
      pop();
      push();
      fill(#00ffff);
      translate(20, -20);
      rotate(radians(-30));
      ellipse(0, 0, 10, 4);
      pop();
      push();
      fill(#00ff00);
      translate(0, 25);
      rotate(radians(0));
      ellipse(0, 0, 10, 4);
      pop();
      push();
      fill(#ff00ff);
      translate(0, 0);
      rotate(radians(-120));
      ellipse(0, 0, 10, 4);
      pop();
      push();
      fill(#FF7403);
      translate(-20, -7);
      rotate(radians(-10));
      ellipse(0, 0, 10, 4);
      pop();
    } 
    else
    {
      fill(#AD6E3B);
      ellipse(0, 0, 100, 100);
      fill(#ff0000);
      ellipse(15, 5, 10, 10);
      fill(#00ff00);
      ellipse(0, 30, 10, 10);
      fill(#0000ff);
      ellipse(-20, 0, 10, 10);
      fill(#ffff00);
      ellipse(10, -25, 10, 10);
      fill(#E3C867);
      push();
      translate(-15, -25);
      rotate(radians(45));
      ellipse(0, 0, 15, 10);
      stroke(#B9A042);
      line(7, 0, -7, 0);
      pop();
      push();
      translate(-20, 25);
      rotate(radians(-45));
      ellipse(0, 0, 15, 10);
      stroke(#B9A042);
      line(7, 0, -7, 0);
      pop();
      push();
      translate(25, -10);
      rotate(radians(80));
      ellipse(0, 0, 15, 10);
      stroke(#B9A042);
      line(7, 0, -7, 0);
      pop();
      push();
      rotate(radians(10));
      translate(0, 0);
      fill(#3D1758);
      ellipse(0, 0, 7, 10);
      ellipse(-3, 0, 4, 4);
      ellipse(2.5, 1.5, 4, 4);
      ellipse(0, -5, 4, 4);
      pop();
      push();
      rotate(radians(15));
      translate(25, 20);
      fill(#3D1758);
      ellipse(0, 0, 7, 10);
      ellipse(-3, 0, 4, 4);
      ellipse(2.5, 1.5, 4, 4);
      ellipse(0, -5, 4, 4);
      pop();
      push();
      rotate(radians(-10));
      translate(-35, 5);
      fill(#3D1758);
      ellipse(0, 0, 7, 10);
      ellipse(-3, 0, 4, 4);
      ellipse(2.5, 1.5, 4, 4);
      ellipse(0, -5, 4, 4);
      pop();
    }
    pop();
  }
}
