class World
{
  Tile[][] map;
  int w = 50;
  int h = 50;
  int weight = 2;
  
  World()
  {
    map = new Tile[2][2];
    map[0][0] = Tile.SOLID;
    map[0][1] = Tile.DOT;
    map[1][0] = Tile.STRIPE;
    map[1][1] = Tile.EMPTY;
  }
  
  void draw()
  {
    for(int x = 0; x < map.length; x++)
    {
      for(int y = 0; y < map[x].length; y++)
      {
        noFill();
        stroke(#0004a6);
        strokeWeight(weight);
        switch(map[x][y])
        {
          case EMPTY:
            rect(x * w + weight/2, y * h + weight/2, w - weight, h - weight);
          break;
          case DOT:
            rect(x * w + weight/2, y * h + weight/2, w - weight, h - weight);
            for(int i = 0; i < 3; i++)
            {
              for(int j = 0; j < 3; j++)
              {
                strokeWeight(weight * 2);
                point(x * w + (w/3.5) * i + (w/4.5), y * w + (h/3.5) * j + (h/4.5));
              }
            }
          break;
          case STRIPE:
            line(x * w + (w - weight/2)/2, y * h, x * w + (w - weight/2), y * h + (h - weight/2)/2);
            line(x * w, y * h, x * w + (w - weight/2), y * h + (h - weight/2));
            line(x * w + (w - weight/2)/2, y * h + (h - weight/2), x * w, y * h + (h - weight/2)/2);
            rect(x * w + weight/2, y * h + weight/2, w - weight, h - weight);
          break;
          case SOLID:
            fill(#0004a6);
            rect(x * w + weight/2, y * h + weight/2, w - weight, h - weight);
          break;
        }
      }
    }
  }
  
  void tick()
  {
    
  }
}

enum Tile
{
  EMPTY,
  DOT,
  STRIPE,
  SOLID
}
