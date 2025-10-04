class UI
{ 
  int select = 0;
  int direction;
  
  int px;
  int py;
  
  UI()
  {
    
  }
  
  void draw()
  {
    noFill();
    stroke(ink);
    strokeWeight(weight);
    push();
      translate(width - 100, 0);
      rect(weight/2, weight/2, 100 - weight, height - weight);
      
      int l = height/5;
      int space = (l - 50)/2;
      
      rect(25, space, 50, 50);
      line(25, space + 12.5 * 1, 75, space + 12.5 * 1);
      line(25, space + 12.5 * 2, 75, space + 12.5 * 2);
      line(25, space + 12.5 * 3, 75, space + 12.5 * 3);
      
      rect(25 + 15/2, l + space + 15/2, 35, 35);
      
      rect(25, l * 2 + space + 15/2, 50, 35);
      
      rect(25, l * 3 + space, 50, 50);
      
      rect(25, l * 3 + space, 50, 50);
      
      rect(20, l * select + space - 5, 60, 60);
    pop();
    stroke(ink, 255/2);
    int x = mouseX/w;
    int y = mouseY/h;
    if(select == 0)
    {
      x = min(x, (width  - 100)/w - 1);
      y = min(y, height/h - 1);
      drawTile(find(), x, y);
    }
    else if(select == 1)
    {
      x = min(x, (width  - 100)/w - 2);
      y = min(y, height/h - 2);
      push();
        fill(background, 255/2);
        noStroke();
        rect(x * w, y * h, 2 * w, 2 * h);
      pop();
      stroke(ink);
      drawTile(Tile.ASSEMBLER_TOP_LEFT, x, y);
    }
  }
  
  void keyPressed()
  {
    if(key == 'r')
    {
      direction++;
      if (select == 0 && direction >= 12)
      {
        direction = 0;
      }
    }
  }
  
  int[][] mouseDragged(int x, int y)
  {
    if(mouseButton == RIGHT)
    {
      return new int[][]{{Tile.EMPTY.index, x, y}};
    }
    if(px != x || py != y)
    {
      
      Tile pTile = world.map[px][py];
      int direction;
      Tile newTile;
      if(px - x < 0) // >0 left >0 down
      {
        direction = 1;
        newTile = Tile.RIGHT_CONVAYER;
      }
      else if(px - x > 0)
      {
        direction = 3;
        newTile = Tile.LEFT_CONVAYER;
      }
      else if(py - y > 0)
      {
        direction = 0;
        newTile = Tile.UP_CONVAYER;
      }
      else
      {
        direction = 2;
        newTile = Tile.DOWN_CONVAYER;
      }
      int in = pTile.in;
      Tile pNewTile = inOutTile(in, direction);
      if(pNewTile != null)
      {
        int[][] out = new int[][]
        {{newTile.index, x, y},
        {pNewTile.index, px, py}};
        px = x;
        py = y;
        return out;
      }
    }
    px = x;
    py = y;
    return null;
  }
  
  Tile mousePressed(int x, int y)
  {
    px = x;
    py = y;
    if(width - mouseX <= 100)
    {
      select = mouseY/(height/5);
      print(select);
      return null;
    }
    if(mouseButton == RIGHT)
    {
      return Tile.EMPTY;
    }
    else
    {
      return find();
    }
  }
  
  Tile inOutTile(int in, int out)
  {
    switch(in + out * 10)
    {
      case 20:
        return Tile.DOWN_CONVAYER; //fixed
      case 02:
        return Tile.UP_CONVAYER;  //fixed
      case 13:
        return Tile.RIGHT_CONVAYER;  //fixed
      case 31:
        return Tile.LEFT_CONVAYER;  //fixed
      case 23:
        return Tile.RIGHT_RIGHT_CONVAYER;  //fixed
      case 21:
        return Tile.LEFT_LEFT_CONVAYER;  //fixed
      case 30:
        return Tile.DOWN_RIGHT_CONVAYER;  //fixed
      case 32:
        return Tile.UP_LEFT_CONVAYER;  //fixed
      case 1:
        return Tile.LEFT_RIGHT_CONVAYER;  //fixed
      case 3:
        return Tile.RIGHT_LEFT_CONVAYER;  //fixed
      case 12:
        return Tile.UP_RIGHT_CONVAYER;  //fixed
      case 10:
        return Tile.DOWN_LEFT_CONVAYER;  //fixed
      default:
        return null;
    }
  }
  
  Tile find()
  {
    if(select == 0)
    {
      switch(direction)
      {
        case 0:
          return Tile.UP_LEFT_CONVAYER;
        case 1:
          return Tile.UP_CONVAYER;
        case 2:
          return Tile.UP_RIGHT_CONVAYER;
        case 3:
          return Tile.RIGHT_LEFT_CONVAYER;
        case 4:
          return Tile.RIGHT_CONVAYER;
        case 5:
          return Tile.RIGHT_RIGHT_CONVAYER;
        case 6:
          return Tile.DOWN_LEFT_CONVAYER;
        case 7:
          return Tile.DOWN_CONVAYER;
        case 8:
          return Tile.DOWN_RIGHT_CONVAYER;
        case 9:
          return Tile.LEFT_LEFT_CONVAYER;
        case 10:
          return Tile.LEFT_CONVAYER;
        case 11:
          return Tile.LEFT_RIGHT_CONVAYER;
      }
    }
    else if(select == 1)
    {
      return Tile.ASSEMBLER_TOP_LEFT;
    }
    return Tile.EMPTY;
  }
}
