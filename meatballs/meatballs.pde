ArrayList<Ball> balls /* haha */ = new ArrayList<Ball>();
ArrayList<Box> boxes = new ArrayList<Box>();

void setup()
{
  size(800, 800, P2D);
  balls.add(new Ball(random(0, 800), random(0, 800), random(20, 70), random(0, 10), random(0, 10)));
  balls.add(new Ball(random(0, 800), random(0, 800), random(20, 70), random(0, 10), random(0, 10)));
  balls.add(new Ball(random(0, 800), random(0, 800), random(20, 70), random(0, 10), random(0, 10)));
  //balls.add(new Ball(random(0, 800), random(0, 800), random(20, 70), random(0, 10), random(0, 10)));
  //balls.add(new Ball(random(0, 800), random(0, 800), random(20, 70), random(0, 10), random(0, 10)));
  //balls.add(new Ball(random(0, 800), random(0, 800), random(20, 70), random(0, 10), random(0, 10)));
  //boxes.add(new Box(random(0, 800), random(0, 800)));
}

void draw()
{
  for(int i = 0; i < balls.size(); i++)
  {
    balls.get(i).modify();
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
      for(int i = 0; i < boxes.size(); i++)
      {
        value += boxes.get(i).f(x, y);
      }
      
      value = (value < 100 ? 255 : 0);
      
      pixels[x + y * width] = color(value, value, value);
    }
  }
  updatePixels();
}
