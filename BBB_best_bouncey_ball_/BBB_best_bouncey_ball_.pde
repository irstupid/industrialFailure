ArrayList<Ball> balls /* haha */ = new ArrayList<Ball>();

void setup()
{
  size(800, 800);
  balls.add(new Ball(width/2, height/2, 5, 3, 100, 20));
  balls.add(new Ball(100, 100, 2, -5, 50, 10));
}

void draw()
{
  background(90);
  checkCollisions();
  for(int i = 0; i < balls.size(); i++)
  {
    balls.get(i).update();
  }
  for(int i = 0; i < balls.size(); i++)
  {
    balls.get(i).paint();
  }
}

void checkCollisions()
{
  for(int i = 0; i < balls.size(); i++)
  {
    for(int j = 0; j < i; j++)
    {
      Ball ball1 = balls.get(i);
      Ball ball2 = balls.get(j);
      if(dist(ball1.position.x, ball1.position.y, ball2.position.x, ball2.position.y) < (ball1.size + ball2.size)/2 && ball1 != ball2)
      {
        print("bonk");
        Ball temp = ball1;
        ball1.velocity = collide(ball1.velocity, ball2.velocity, ball1.mass, ball2.mass);
        ball2.velocity = collide(temp.velocity, ball2.velocity, temp.mass, ball2.mass);
      }
    }
  }
}

PVector collide(PVector v1, PVector v2, float m1, float m2)
{
  return new PVector(((v1.x * (m1 - m2)) + (2 * m2 * v2.x))/(m1 + m2), ((v1.y * (m1 - m2)) + (2 * m2 * v2.y))/(m1 + m2));
}
