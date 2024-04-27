ArrayList<Ball> balls /* haha */ = new ArrayList<Ball>();

void setup()
{
  size(800, 800);
  balls.add(new Ball(width/2, height/2, 5, 3, 100, 10));
  balls.add(new Ball(100, 100, 3, -5, 50, 20));
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
  if(dist(balls.get(0).position.x, balls.get(0).position.y, balls.get(1).position.x, balls.get(1).position.y) < (balls.get(0).size + balls.get(1).size)/2)
  {
    print("bonk");
    Ball ball1 = balls.get(0);
    Ball ball2 = balls.get(1);
    PVector temp = ball1.velocity;
    balls.get(0).velocity = collide(ball1.velocity, ball2.velocity, ball1.mass, ball2.mass);
    balls.get(1).velocity = collide(ball2.velocity, temp, ball2.mass, ball1.mass);
  }
}

PVector collide(PVector v1, PVector v2, float m1, float m2)
{
  return new PVector(((v1.x * (m1 - m2)) + (2 * m2 * v2.x))/(m1 + m2), ((v1.y * (m1 - m2)) + (2 * m2 * v2.y))/(m1 + m2));
}
