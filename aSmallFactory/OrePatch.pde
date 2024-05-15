class OrePatch
{
  int type;
  int x;
  int y;
  
  ArrayList<Ore> ores;
  
  OrePatch(int x, int y, int type)
  {
    this.x = x;
    this.y = y;
    this.type = type;
  }
  
  OrePatch(int type)
  {
    this.type = type;
    this.x = floor(random(0, 18));
    this.y = floor(random(0, 13));
  }
  
  void draw()
  {
    for(int i = 0; i < ores.size(); i++)
    {
      ores.get(i).draw();
    }
  }
  
  void aggregate()
  {
    ores = new ArrayList<Ore>();
  }
  
  void additive()
  {
    ores = new ArrayList<Ore>();
    ArrayList<PVector> points = new ArrayList<PVector>();
    
    ores.add(new Ore(x, y, type));
    points.add(new PVector(x, y));
    for(int i = 1; i < 10;)
    {
      //println("new point");
      PVector point;
      point = points.get(floor(random(0, points.size())));
      
      switch(floor(random(0, 4)))
      {
        case(0):
          //println("x + 1");
          point = new PVector(point.x + 1, point.y);
          break;
        case(1):
          //println("x - 1");
          point = new PVector(point.x - 1, point.y);
          break;
        case(2):
          //println("y + 1");
          point = new PVector(point.x, point.y + 1);
          break;
        case(3):
          //println("y - 1");
          point = new PVector(point.x, point.y - 1);
          break;
      }
      
      point.x = constrain(point.x, 0, 17);
      point.y = constrain(point.y, 0, 12);
      
      if(!(includes(points, point)))
      {
        //println("succses");
        points.add(point);
        i++;
      }
      //else
      //{
      //  println("failure");
      //}
    }
    
    for(int i = 0; i < points.size(); i++)
    {
      ores.add(new Ore((int) points.get(i).x,(int) points.get(i).y, type));
    }
  }
  
  boolean includes(ArrayList<PVector> points, PVector point)
  {
    //println("includes test");
    for(int i = 0; i < points.size(); i++)
    {
      if(points.get(i).x == point.x && points.get(i).y == point.y)
      {
        //println("test succsess");
        return true;
      }
    }
    //println("test failure");
    return false;
  }
}
