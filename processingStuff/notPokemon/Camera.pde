class Camera
{
  float x = 0;
  float y = 0;
  Map<PImage> map;
  int mapWidth;
  int mapHeight;
  
  Camera()
  {
    
  }
  
  void setMap(Map<PImage> map)
  {
    this.map = map;
    mapHeight = 0;
    mapWidth = 0;
    for(int i = 0; i < map.getWidth(); i++)
    {
      int cHeight = 0;
      int maxWidth = 0;
      for(int j = 0; j < map.getHeight(); j++)
      {
        cHeight += map.get(i, j).height;
        if(map.get(i, j).width > maxWidth)
        {
          maxWidth = map.get(i, j).width;
        }
      }
      if(cHeight > mapHeight)
      {
        mapHeight = cHeight;
      }
      mapWidth += maxWidth;
    }
    //println(mapWidth);
    //println(mapHeight);
  }
  
  void setPosition(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  void draw()
  {
    if(x < 0)
    {
      x = 0;
    }
    if(x > mapWidth - width)
    {
      x = mapWidth - width;
    }
    if(y < 0)
    {
      y = 0;
    }
    if(y > mapHeight - height)
    {
      y = mapHeight - height;
    }
    
    push();
      translate(-x, -y);
      for(int x = 0; x < map.getWidth(); x++)
      {
        int largestWidth = 0;
        push();
          for(int y = 0; y < map.getHeight(); y++)
          {
           PImage image = map.get(x, y);
           image(image, 0, 0);
           translate(0, image.height);
           if(image.width > largestWidth)
           {
             largestWidth = image.width;
           }
          }
        pop();
        translate(largestWidth, 0);
      }
    pop();
  }
}
