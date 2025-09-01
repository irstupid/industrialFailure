import java.util.function.Consumer;

class UI
{
  UI()
  {
    
  }
  
  int select;
  int direction;
  
  void draw()
  {
    noFill();
    stroke(#0004a6);
    strokeWeight(weight);
    push();
      translate(width - 100, 0);
      rect(weight/2, weight/2, 100 - weight, height - weight);
      
      rect(25, 25, 50, 50);
      line(25, 25 + 12.5 * 1, 75, 25 + 12.5 * 1);
      line(25, 25 + 12.5 * 2, 75, 25 + 12.5 * 2);
      line(25, 25 + 12.5 * 3, 75, 25 + 12.5 * 3);
      
      switch(select)
      {
        case 0:
          rect(20, 20, 60, 60);
        break;
      }
    pop();
    stroke(#0004a6, 255/2);
    int x = mouseX/w;
    int y = mouseY/h;
    x = min(x, (width  - 100)/w - 1);
    y = min(y, height/h - 1);
    drawTile(find(), x, y);
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
  
  Tile mousePressed(int x, int y)
  {
    if(mouseButton == RIGHT)
    {
      return Tile.EMPTY;
    }
    else
    {
      return find();
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
    return null;
  }
}
