PImage tileSet;

int [][] room = {
  {0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 4, 5, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 7, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 6, 0, 0, 0, 0, 0, 7, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 7, 0, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 3, 4, 5, 0, 0, 0, 0, 7, 0},
  {0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 7, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 2, 1, 2, 0, 0, 7, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 2, 1, 2, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0},
  {8, 8, 8, 8, 8, 8, 8, 1, 2, 1, 2, 1, 2, 8, 8, 8, 8, 8, 8, 8},
};

int selectedType = -1;
boolean pmousePressed = false;

void setup()
{
  size(960, 960);
  tileSet = loadImage("dullRoomTile.png");
}

void draw()
{
  background(200);
  
  for(int i = 0; i < height/48; i++)
  {
    for(int j = 0; j < width/48; j++)
    {
      if(room[i][j] == 1)
      {
          image(tileSet, j * 48, i * 48, 48, 48, 0, 0, 192, 192);
      }
      if(room[i][j] == 2)
      {
          image(tileSet, j * 48, i * 48, 48, 48, 0, 192, 192, 384);
      }
      if(room[i][j] == 3)
      {
          image(tileSet, j * 48, i * 48, 48, 48, 384, 0, 576, 192);
      }
      if(room[i][j] == 4)
      {
          image(tileSet, j * 48, i * 48, 48, 48, 192, 192, 384, 384);
      }
      if(room[i][j] == 5)
      {
          image(tileSet, j * 48, i * 48, 48, 48, 384, 192, 576, 384);
      }
      if(room[i][j] == 6)
      {
          image(tileSet, j * 48, i * 48, 48, 48, 192, 0, 384, 192);
      }
      if(room[i][j] == 7)
      {
          image(tileSet, j * 48, i * 48, 48, 48, 576, 0, 768, 192);
      }
      if(room[i][j] == 8)
      {
          image(tileSet, j * 48, i * 48, 48, 48, 576, 192, 768, 384);
      }
    }
  }
  
  if(mousePressed)
  {
    if((round(mouseX/48) != round(pmouseX/48) || round(mouseY/48) != round(pmouseY/48)) || pmousePressed)
    {
      if(mouseButton == LEFT)
      {
        placeBlock(round(mouseX/48), round(mouseY/48), selectedType);
      }
      if(mouseButton == RIGHT)
      {
        placeBlock(round(mouseX/48), round(mouseY/48), 0);
      }
    }
    
    pmousePressed = false;
  }
  else
  {
    pmousePressed = true;
  }
  
  println(selectedType);
}

void keyPressed()
{
  if(key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8')
  {
    selectedType = key - 48;
  }
}

void placeBlock(int x,int y, int type)
{
  if(x < 20 && y < 20 && x > -1 && y > -1 && type != -1)
  {
    room[y][x] = type;
    
    if(type == 1)
    {
      selectedType = 2;
    }
    else if(type == 2)
    {
      selectedType = 1;
    }
    
    if(y == 19 && type == 0)
    {
      room[y][x] = 8;
    }
  }
}
