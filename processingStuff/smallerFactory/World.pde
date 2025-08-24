class World
{
  Tile[][] map;
  int w = 50;
  int h = 50;
  
  World()
  {
    map = new Tile[floor((width - 100)/w)][floor(height/h)];
    for(int i = 0; i < map.length; i++)
    {
      for(int j = 0; j < map[i].length; j++)
      {
        map[i][j] = Tile.EMPTY;
      }
    }
    generate(Tile.DOT);
    generate(Tile.STRIPE);
    generate(Tile.SOLID);
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
            fill(#0004a6, 255/2);
            rect(x * w + weight/2, y * h + weight/2, w - weight, h - weight);
          break;
        }
      }
    }
  }
  
  void tick()
  {
    
  }
  
  void generate(Tile type)
  {
    IntList patchX = new IntList();
    IntList patchY = new IntList();
    int startX = floor(random(0, map.length));
    int startY = floor(random(0, map[0].length));
    while(!(map[startX][startY] == Tile.EMPTY))
    {
      startX = floor(random(0, map.length));
      startY = floor(random(0, map[0].length));
    }
    patchX.append(startX);
    patchY.append(startY);
    int size = floor(random(3, 8));
    for(int i = 0; i < size;)
    {
      int start = floor(random(0, patchX.size()));
      int x = patchX.get(start);
      int y = patchY.get(start);
      switch(floor(random(0, 4)))
      {
        case 0:
          x++;
        break;
        case 1:
          x--;
        break;
        case 2:
          y++;
        break;
        case 3:
          y--;
        break;
      }
      if(x < map.length && x >= 0 && y < map[0].length && y >= 0)
      {
        boolean intersection = false;
        for(int j = 0; j < patchX.size(); j++)
        {
          if(patchX.get(j) == x && patchY.get(j) == y)
          {
            intersection = true;
          }
        }
        if(!intersection)
        {
          patchX.append(x);
          patchY.append(y);
          i++;
        }
      }
    }
    for(int i = 0; i < patchX.size(); i++)
    {
      map[patchX.get(i)][patchY.get(i)] = type;
    }
  }
}

enum Tile
{
  EMPTY,
  DOT,
  STRIPE,
  SOLID
}
