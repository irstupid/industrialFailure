ArrayList<Ball> balls /* haha */ = new ArrayList<Ball>();
PImage mask;

void setup()
{
  size(800, 800, P2D);
  //balls.add(new Ball(width/2, height/2, 5, 3, 100, 20));
  //balls.add(new Ball(100, 100, 3, -5, 50, 10));
  //balls.add(new Ball(400, 500, 6,0, 75, 15));
  for(int i = 0; i < 25; i++)
  {
    balls.add(new Ball(random(50, width - 50), random(50, height - 50), random(-7, 7), random(-7, 7), 50, 10));
  }
  mask = loadImage("putty.jpeg");
  mask.loadPixels();
}

void draw()
{
  background(90);
  checkCollisions();
  for(int i = 0; i < balls.size(); i++)
  {
    balls.get(i).update();
  }
  loadPixels();
  for(int x = 0; x < width; x++)
  {
    for(int y = 0; y < height; y++)
    {
      int value = 0;
      for(int i = 0; i < balls.size(); i++)
      {
        value += balls.get(i).f(x, y);
      }
      
      value = (value > 500 /* && value < 510 */ ? mask.pixels[x + y * 800]/* x + y */ : 0);
      
      //while(value > 255)
      //{
      //  value -= 255;
      //}
      colorMode(HSB);
      pixels[x + y * width] = value; //color(value, 150, value * 255);
    }
  }
  updatePixels();
}

void checkCollisions()
{
  for(int i = 0; i < balls.size(); i++)
  {
    for(int j = 0; j < i; j++)
    {
      if(dist(balls.get(i).position.x, balls.get(i).position.y, balls.get(j).position.x, balls.get(j).position.y) < (balls.get(i).size + balls.get(j).size)/2)
      {
        //print("bonk");
        Ball ball1 = balls.get(i);
        Ball ball2 = balls.get(j);
        PVector temp = ball1.velocity;
        balls.get(i).velocity = collide(ball1.velocity, ball2.velocity, ball1.mass, ball2.mass);
        balls.get(j).velocity = collide(ball2.velocity, temp, ball2.mass, ball1.mass);
      }
    }
  }
}

PVector collide(PVector v1, PVector v2, float m1, float m2)
{
  return new PVector(((v1.x * (m1 - m2)) + (2 * m2 * v2.x))/(m1 + m2), ((v1.y * (m1 - m2)) + (2 * m2 * v2.y))/(m1 + m2));
}