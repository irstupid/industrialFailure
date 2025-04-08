class Shape
{
  Point[] points;
  Joint[] joints;
  
  ArrayList<Point> tempPoints;
  ArrayList<Joint> tempJoints;
  
  Shape()
  {
    tempPoints = new ArrayList<Point>();
    tempJoints = new ArrayList<Joint>();
  }
  
  Shape addPoint(float x, float y)
  {
    tempPoints.add(new Point(x, y, GRAVITY));
    return this;
  }
  
  Shape addJoint(int p1, int p2)
  {
    tempJoints.add(new Joint(tempPoints.get(p1), tempPoints.get(p2)));
    return this;
  }
  
  Shape build()
  {
    points = new Point[tempPoints.size()];
    for(int i = 0; i < points.length; i++)
    {
      points[i] = tempPoints.get(i);
    }
    tempPoints = null;
    joints = new Joint[tempJoints.size()];
    for(int i = 0; i < joints.length; i++)
    {
      joints[i] = tempJoints.get(i);
    }
    tempJoints = null;
    return this;
  }
  
  void draw()
  {
    for(int i = 0; i < points.length; i++)
    {
      points[i].draw();
    }
    for(int i = 0; i < joints.length; i++)
    {
      joints[i].draw();
    }
  }
  
  void update()
  {
    for(int i = 0; i < points.length; i++)
    {
      points[i].update();
    }
    for(int i = 0; i < joints.length; i++)
    {
      joints[i].update();
    }
  }
  
  Point[] getPoints() { return points; }
  Point getPoint(int i) { return points[i]; }
}
