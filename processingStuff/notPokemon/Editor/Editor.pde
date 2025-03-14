String NAME = "testRoute.json";

JSONObject rawMap;

String[][] map;
int w, h;
int x, y;
int cameraX, cameraY;
String lastTile;

void setup()
{
  size(1000, 1000);
  rawMap = loadJSONObject(NAME);
  w = rawMap.getInt("width");
  h = rawMap.getInt("height");
  map = new String[w][h];
  JSONArray rawTiles = rawMap.getJSONArray("map");
  for(int i = 0; i < rawTiles.size(); i++)
  {
    JSONObject tile = rawTiles.getJSONObject(i);
    int x = tile.getInt("x");
    int y = tile.getInt("y");
    String type = tile.getString("tile");
    map[x][y] = type;
  }
  x = -1;
  y = -1;
  cameraX = 0;
  cameraY = 0;
  lastTile = "";
}

void draw()
{
  background(90);
  for(int i = 0; i < map.length; i++)
  {
    for(int j = 0; j < map[i].length; j++)
    {
      if(i == x && j == y)
      {
        fill(#00ff00);
      }
      else
      {
        fill(#aaaaaa);
      }
      rect(i * 100 + cameraX * 100, j * 100 + cameraY * 100, 100, 100);
      fill(#000000);
      text(map[i][j], i * 100 + cameraX * 100 + 25, j * 100 + cameraY * 100 + 50);
    }
  }
}

void mousePressed()
{
  int clickX = floor((mouseX - cameraX * 100)/100);
  int clickY = floor((mouseY - cameraY * 100)/100);
  if((mouseButton == LEFT))
  {
    if(clickX > map.length || clickY > map[0].length || (clickX == x && clickY == y))
    {
      x = -1;
      y = -1;
    }
    else
    {
      x = clickX;
      y = clickY;
      lastTile = map[x][y];
    }
  }
  else
  {
    x = -1;
    y = -1;
    map[clickX][clickY] = lastTile;
  }
}

void keyPressed()
{
  if(x == -1)
  {
    switch(key)
    {
      case 'w':
        cameraY--;
      break;
      case 'a':
        cameraX--;
      break;
      case 's':
        cameraY++;
      break;
      case 'd':
        cameraX++;
      break;
      case '+': case '=':
        h++;
        resizeMap();
      break;
      case '-':
        h--;
        resizeMap();
      break;
      case '.':
        w++;
        resizeMap();
      break;
      case ',':
        w--;
        resizeMap();
      break;
    }
  }
  else
  {
    if(key == BACKSPACE || key == DELETE)
    {
      char[] ch = new char[map[x][y].length()];
      map[x][y].getChars(0, ch.length, ch, 0);
      ch[ map[x][y].] = c;
       map[x][y] = String(ch);
    }
    else
    {
      map[x][y] = map[x][y] + key;
    }
  }
}

void resizeMap()
{
  String[][] newMap = new String[w][h];
  for(int i = 0; i < w; i++)
  {
    if(i < map.length)
    {
      for(int j = 0; j < h; j++)
      {
        if(j < map[i].length)
        {
          newMap[i][j] = map[i][j];
        }
        else
        {
          newMap[i][j] = "";
        }
      }
    }
    else
    {
      for(int j = 0; j < h; j++)
      {
        newMap[i][j] = "";
      }
    }
  }
  map = newMap;
}
