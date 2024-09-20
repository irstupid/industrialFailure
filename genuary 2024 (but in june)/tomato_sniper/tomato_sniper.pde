ArrayList<Tomato> tomatos;
Roomba roomba;
Shoot shoot;

void setup()
{
  size(800, 800, P2D);
  //tomato.resize(0, 100);
  colorMode(HSB);
  tomatos = new ArrayList<Tomato>();
  for(int i = 0; i < 3; i++)
  {
    tomatos.add(new Tomato(color(random(0, 255), 255, 255), color(random(0, 255), 255, 255), random(0, width), random(0, height)));
  }
  roomba = new Roomba(width/2, height/2);
  shoot = new Shoot();
  textFont(createFont("bubble.ttf", 128));
}

void draw()
{
  background(150);
  for(int i = 0; i < tomatos.size(); i++)
  {
    tomatos.get(i).targetX = roomba.x;
    tomatos.get(i).targetY = roomba.y;
    tomatos.get(i).draw();
  }
  roomba.stop = shoot.active;
  roomba.draw();
  shoot.draw();
  text("poopoo!", 0, 128);
}

void keyPressed()
{
  roomba.keyPressed();
  shoot.keyPressed();
  if(key == ' ')
  {
    shoot.x = roomba.x;
    shoot.y = roomba.y;
    shoot.active = true;
  }
}

void keyReleased()
{
  roomba.keyReleased();
  shoot.keyReleased();
  if(key == ' ')
  {
    shoot.active = false;
  }
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
