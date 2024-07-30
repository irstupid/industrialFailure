PImage tomato;
Tomato enemy;
Roomba roomba;

void setup()
{
  size(800, 800, P2D);
  tomato = loadImage("tomato.png");
  //tomato.resize(0, 100);
  colorMode(HSB);
  enemy = new Tomato(color(random(0, 255), 255, 255), color(random(0, 255), 255, 255), width/2, height/2);
  roomba = new Roomba(width/2, height/2);
}

void draw()
{
  background(150);
  enemy.draw();
  enemy.targetX = roomba.x;
  enemy.targetY = roomba.y;
  roomba.draw();
}

void keyPressed()
{
  roomba.keyPressed();
}

void keyReleased()
{
  roomba.keyReleased();
}

//void tomato(float x, float y, float r, int tc, int lc)
//{
//  push();
//    rotate(radians(r));
//    translate(x, y);
//    noStroke();
//    rectMode(CENTER);
//    fill(tc);
//    ellipse(0, 0, 120, 100);
//    fill(lc);
//    rect(0, -55, 10, 20);
//    push();
//      rotate(radians(30));
//      translate(-17, 4);
//      triangle(5, -47, -5, -47, 0, -65);
//    pop();
//    push();
//      rotate(radians(-30));
//      translate(17, 4);
//      triangle(5, -47, -5, -47, 0, -65);
//    pop();
    
//  pop();
//}
