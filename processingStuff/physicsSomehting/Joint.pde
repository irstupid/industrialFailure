class Joint
{
  Point p1;
  Point p2;
  float d;
  
  Joint(Point p1, Point p2, float d)
  {
    this.p1 = p1;
    this.p2 = p2;
    this.d = d;
  }
  
  Joint(Point p1, Point p2)
  {
    this.p1 = p1;
    this.p2 = p2;
    d = p1.getPosition().dist(p2.getPosition());
  }
  
  void draw()
  {
    push();
      stroke(#777777);
      strokeWeight(5);
      line(p1.getX(), p1.getY(), p2.getX(), p2.getY());
      //p1.draw();
      //p2.draw();
    pop();
  }
  
  void update()
  {
    //p1.update();
    //p2.update();
    //p1.setPosition(width/2, height/2);
    
    if(p1.getPosition().dist(p2.getPosition()) > d + 0.01 || p1.getPosition().dist(p2.getPosition()) < d - 0.01)
    {
      PVector pos1 = p1.getPosition().copy();
      PVector pos2 = p2.getPosition().copy();
      float m = pos1.dist(pos2);
      m = m - d;
      PVector direction = pos1.sub(pos2);
      direction.normalize();
      println(m);
      PVector pMid = pos1.copy().add(pos2).div(2);
      //p1.setPosition(pMid.add(direction.copy().mult(m/2)));
      //p2.setPosition(pMid.add(direction.copy().mult(-m/2)));
    }
  }
  
  Point getPoint1() { return p1; }
  void setPoint1(Point value) { p1 = value; }
  Point getPoint2() { return p1; }
  void setPoint2(Point value) { p2 = value; }
}
