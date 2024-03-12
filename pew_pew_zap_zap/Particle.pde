class Particle
{
  float x;
  float y;
  int type;
  
  float[][] points = new float[10][];
  int t;
  
  Particle(float x, float y, int type)
  {
    this.x = x;
    this.y = y;
    this.type = type;
    
    if(type == 1)
    {
      for(int i = 0; i < points.length; i++)
      {
        points[i] = new float[]{random(-30, 30) + x, random(-30, 30) + y, 10};
      }
    }
    else if(type == 2)
    {
      for(int i = 0; i < points.length; i++)
      {
        points[i] = new float[]{random(-10, 10) + x, random(-10, 10) + y, 0};
      }
    }
  }
  
  Particle(float x, float y, int type, float[][] positions)
  {
    this.x = x;
    this.y = y;
    this.type = type;
    points = positions;
  }
  
  void draw()
  {
    t++;
    
    if(type == 1)
    {
      float totalSize = 0;
      
      for(int i = 0; i < points.length; i++)
      {
        points[i][2] += random(10, 5) * (t <= 7 ? 1 : -1);
        if(points[i][2] < 0)
        {
          points[i][2] = 0;
        }
        totalSize += points[i][2];
        
        fill(#FA3F00);
        ellipse(points[i][0], points[i][1], points[i][2], points[i][2]);
        fill(#FAD500);
        ellipse(points[i][0], points[i][1], points[i][2]/2, points[i][2]/2);
      }
      
      if(totalSize == 0)
      {
        particles.remove(this);
      }
    }
    else if(type == 2)
    {
      //float totalSize = 0;
      
      //for(int i = 0; i < points.length; i++)
      //{
      //  points[i][2] += random(20, 10) * (t <= 7 ? 2 : -0.5);
      //  if(points[i][2] < 0)
      //  {
      //    points[i][2] = 0;
      //  }
      //  totalSize += points[i][2];
        
      //  push();
      //    stroke(#ff0000);
      //    strokeWeight(3);
      //    line(x, y, points[i][1] + cos(atan2(points[i][2] + x, points[i][1] + y)), points[i][2] + sin(atan2(points[i][2] + x, points[i][1] + y)));
      //  pop();
      //}
      
      //if(totalSize == 0)
      //{
        particles.remove(this);
      //}
    }
  }
}
