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
  }
  
  void keyPressed()
  {
    if(key == 'r')
    {
      direction++;
      if (select == 0 && direction >= 4)
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
      if(select == 0)
      {
        switch(direction)
        {
          case 0:
            return Tile.UP_CONVAYER;
          case 1:
            return Tile.RIGHT_CONVAYER;
          case 2:
            return Tile.DOWN_CONVAYER;
          case 3:
            return Tile.LEFT_CONVAYER;
        }
      }
    }
    return null;
  }
}
