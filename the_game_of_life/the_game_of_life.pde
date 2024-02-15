boolean pmousePressed;

int[][] cells = 
{
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
};

void setup()
{
  size(1000, 1000);
}

void draw()
{
  background(0);
  
  if(!(keyPressed && key == ' '))
  {
    paint();
  }
  
  dissplay();
  
  if(mousePressed)
  {
    pmousePressed = true;
  }
  else
  {
    pmousePressed = false;
  }
}

void paint()
{
  if(mousePressed && ((round(mouseX/50) != round(pmouseX/50) || round(mouseY/50) != round(pmouseY/50)) || !pmousePressed) && round(mouseX/50) < 20 && round(mouseY/50) < 20  && round(mouseX/50) > 0 && round(mouseY/50) > 0)
  {
    cells[round(mouseY/50)][round(mouseX/50)]++;
    if(cells[round(mouseY/50)][round(mouseX/50)] > 1)
    {
      cells[round(mouseY/50)][round(mouseX/50)] = 0;
    }
  }
}

void step()
{
  int[][] nCells = cells;
  int closeCells = 0;
  int a;
  int b;
  
  for(int y = 0; y <= 19; y++)
  {
    for(int x = 0; x <= 19; x++)
    {
      closeCells = 0;
      
      a = y + 1;
      b = x;
      closeCells += cells[(a < 0 ? 20 + a : (a > 19 ? 20  -  a : a))][(b < 0 ? 20 + b : (b > 19 ? 20  -  b : b))];
      a = y - 1;
      b = x;
      closeCells += cells[(a < 0 ? 20 + a : (a > 19 ? 20  -  a : a))][(b < 0 ? 20 + b : (b > 19 ? 20  -  b : b))];
      a = y + 1;
      b = x + 1;
      closeCells += cells[(a < 0 ? 20 + a : (a > 19 ? 20  -  a : a))][(b < 0 ? 20 + b : (b > 19 ? 20  -  b : b))];
      a = y - 1;
      b = x + 1;
      closeCells += cells[(a < 0 ? 20 + a : (a > 19 ? 20  -  a : a))][(b < 0 ? 20 + b : (b > 19 ? 20  -  b : b))];
      a = y + 1;
      b = x - 1;
      closeCells += cells[(a < 0 ? 20 + a : (a > 19 ? 20  -  a : a))][(b < 0 ? 20 + b : (b > 19 ? 20  -  b : b))];
      a = y - 1;
      b = x - 1;
      closeCells += cells[(a < 0 ? 20 + a : (a > 19 ? 20  -  a : a))][(b < 0 ? 20 + b : (b > 19 ? 20  -  b : b))];
      a = y;
      b = x + 1;
      closeCells += cells[(a < 0 ? 20 + a : (a > 19 ? 20  -  a : a))][(b < 0 ? 20 + b : (b > 19 ? 20  -  b : b))];
      a = y;
      b = x - 1;
      closeCells += cells[(a < 0 ? 20 + a : (a > 19 ? 20  -  a : a))][(b < 0 ? 20 + b : (b > 19 ? 20  -  b : b))];
      
      if(cells[y][x] == 1)
      {
        if(closeCells == 1)
        {
          nCells[y][x] = 1;
        }
        else
        {
          nCells[y][x] = 0;
        }
      }
      else
      {
        if(closeCells == 3)
        {
          nCells[y][x] = 1;
        }
        else
        {
          nCells[y][x] = 0;
        }
      }
    }
  }
  
  cells = nCells;
}

void dissplay()
{
  for(int y = 0; y <= 19; y++)
  {
    for(int x = 0; x <= 19; x++)
    {
      fill(cells[y][x] == 0 ? 0 : cells[y][x] == 1 ? #ffffff : cells[y][x] == 2 ? #ffff00 : cells[y][x] == 3 ? #0000ff : cells[y][x] == 4 ? #ff8800 : cells[y][x] == 5 ? #00ff00 : cells[y][x] == 6 ? #8800ff : cells[y][x] == 7 ? #00ffff : cells[y][x] == 8 ? #ff00ff : cells[y][x] == 9 ? #ffffff : #000000);
      noStroke();
      rect(x * 50, y * 50, 50, 50);
    }
  }
}

void keyPressed()
{
  if(key == ' ')
  {
    step();
  }
}
