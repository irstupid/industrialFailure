class World
{
  Tile[][] map;
  
  int convayerB;
  
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
        stroke(ink);
        strokeWeight(weight);
        drawTile(map[x][y], x, y);
      }
    }
  }
  
  void tick()
  {
    convayerB++;
    if(convayerB > convayerASpeed)
    {
      convayerB = 0;
      convayerA += weight * 2;
      if(convayerA >= w/4)
      {
        convayerA = 0;
      }
    }
  }
  
  void set(Tile tile, int x, int y)
  {
    //uguly af
    if(tile == Tile.EMPTY)
    {
      if(map[x][y] == Tile.ASSEMBLER_TOP_LEFT)
      {
        map[x][y] = tile;
        map[x + 1][y] = Tile.EMPTY;
        map[x][y + 1] = Tile.EMPTY;
        map[x + 1][y + 1] = Tile.EMPTY;
      }
      else if(map[x][y] == Tile.ASSEMBLER_TOP_RIGHT)
      {
        map[x][y] = tile;
        map[x - 1][y] = Tile.EMPTY;
        map[x][y + 1] = Tile.EMPTY;
        map[x - 1][y + 1] = Tile.EMPTY;
      }
      else if(map[x][y] == Tile.ASSEMBLER_BOTTOM_LEFT)
      {
        map[x][y] = tile;
        map[x + 1][y] = Tile.EMPTY;
        map[x][y - 1] = Tile.EMPTY;
        map[x + 1][y - 1] = Tile.EMPTY;
      }
      else if(map[x][y] == Tile.ASSEMBLER_BOTTOM_RIGHT)
      {
        map[x][y] = tile;
        map[x - 1][y] = Tile.EMPTY;
        map[x][y - 1] = Tile.EMPTY;
        map[x - 1][y - 1] = Tile.EMPTY;
      }
    }
    if(map[x][y].index < 13)
    {
      map[x][y] = tile;
    }
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
