float GRAVITY = 1;

Shape shape;
Point point;

void setup()
{
  size(800, 800);
  
  shape = new Shape()
  .addPoint(width/2, height/2)
  .addPoint(width/2 + 100, height/2)
  .addPoint(width/2 + 50, height/2 + 50)
  .addJoint(0, 1)
  .addJoint(1, 2)
  .addJoint(2, 0)
  .build();
  
  point = new Point(width/2, height/2, 10);
}

void draw()
{
  for(int i = 0; i < shape.getPoints().length; i++)
  {
    if(shape.getPoint(i).getPosition().dist(new PVector(mouseX, mouseY)) < 100)
    {
      PVector pos1 = shape.getPoint(i).getPosition().copy();
      PVector pos2 = new PVector(mouseX, mouseY);
      float m = pos1.dist(pos2);
      m = m - 100;
      PVector direction = pos1.sub(pos2);
      direction.normalize();
      println(m);
      shape.getPoint(i).addPosition(direction.copy().mult(-m));
    }
  }
  
  
  shape.update();
  
  background(#000022);
  shape.draw();
}
