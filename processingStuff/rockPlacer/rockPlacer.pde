Tile[][] batch;

int round;
int column;
int row;
boolean finisher = false;

int delay;

void setup()
{
  size(800, 800);
  batch = new Tile[4][5];
  
  for(int x = 0; x < batch.length; x++)
  {
    for(int y = 0; y < batch[x].length; y++)
    {
      batch[x][y] = new Tile(x, y);
    }
  }
}

void draw()
{
  background(220);
  for(int x = 0; x < batch.length; x++)
  {
    for(int y = 0; y < batch[x].length; y++)
    {
      batch[x][y].draw();
    }
  }
  
  delay--;
  if(delay <= 0)
  {
    tick();
    if(round == 0)
    {
      delay = 24;
    }
    else
    {
      delay = 6;
    }
  }
}

void keyPressed()
{
  //tick();
}

void tick()
{
  if(column < batch[0].length && row < batch.length)
  {
    batch[row][column].add();
  }
  
  round++;
  if(round >= 4)
  {
    round = 0;
  }
  
  if(!finisher)
  {
    if(round == 0)
    {
      column++;
      if(column == batch[0].length)
      {
        column = 0;
        row++;
      }
    }
    if(row >= batch.length)
    {
      row = 0;
      column = 0;
      finisher = true;
    }
  }
  else
  {
    row++;
    if(row >= batch.length)
    {
      column++;
      row = 0;
    }
  }
}
