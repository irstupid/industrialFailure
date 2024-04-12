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
        points[i] = new float[]{0, 0, 0};
      }
    }
    else if(type == 2)
    {
      for(int i = 0; i < points.length; i++)
      {
        points[i] = new float[]{random(0, 359), random(2, 10), 0};
      }
    }
    else if(type == 3)
    {
      for(int i = 0; i < points.length; i++)
      {
        points[i] = new float[]{x, y, (i + 1) * 2.5};
      }
    }
    else if(type == 4)
    {
      for(int i = 0; i < points.length; i++)
      {
        points[i] = new float[]{random(-30, 30) + x, random(-30, 30) + y, 10};
      }
    }
    else if(type == 5)
    {
      for(int i = 0; i < points.length; i++)
      {
        points[i] = new float[]{0, 0, 0};
      }
    }
  }
  
  void draw()
  {
    t++;
    if (type == 1)
    {
      points[0][2] += random(10, 5) * (t <= 7 ? 1 : -1);
      if(points[0][2] < 0)
      {
        particles.remove(this);
      }
        
      push();
        fill(#FA3F00);
        ellipse(x, y, points[0][2], points[0][2]);
        fill(#FAD500);
        ellipse(x, y, points[0][2]/2, points[0][2]/2);
      pop();
    }
    else if(type == 4)
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
        
        push();
          fill(#FA3F00);
          ellipse(points[i][0], points[i][1], points[i][2], points[i][2]);
          fill(#FAD500);
          ellipse(points[i][0], points[i][1], points[i][2]/2, points[i][2]/2);
        pop();
      }
      
      if(totalSize == 0)
      {
        particles.remove(this);
      }
    }
    else if(type == 2)
    {
      float totalMagnitude = 0;
      
      push();
        stroke(#ff0000);
        strokeWeight(3);
        for(int i = 0; i < points.length; i++)
        {
          points[i][1] += random(10, 5) * (t <= 3 ? 2 : -0.5);
          if(points[i][1] < 0)
          {
            points[i][1] = 0;
          }
          totalMagnitude += points[i][1];
          
          if(i < points.length - 1)
          {
            line(points[i][1] * cos(radians(points[i][0])) + x, points[i][1] * sin(radians(points[i][0])) + y, x, y);
          }
        }
      pop();
      
      if(totalMagnitude == 0)
      {
        particles.remove(this);
      }
    }
    else if(type == 3)
    {
      for(int i = 0; i < points.length; i++)
      {
        points[i][2] -= 1.2;
        
        if(points[i][2] <= 0)
        {
          points[i][0] = x;
          points[i][1] = y;
          points[i][2] = 25;
        }
        
        push();
          noStroke();
          fill(#FA3F00, points[i][2] * 10);
          ellipse(points[i][0], points[i][1], points[i][2], points[i][2]);
        pop();
      }
    }
    else if(type == 5)
    {
      push();
        noFill();
        stroke(#ffffff);
        strokeWeight(2);
        ellipse(x, y, t * 2, t * 2);
      pop();
      
      if(t > 5)
      {
        particles.remove(this);
      }
    }
  }
}
