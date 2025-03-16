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
        fill(map[i][j].length() * 50, alpabetize(map[i][j].charAt(0)) * 10, alpabetize(map[i][j].charAt(map[i][j].length() - 1)) * 10);
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
  else if(!(clickX > map.length || clickY > map[0].length))
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
        cameraY++;
      break;
      case 'a':
        cameraX++;
      break;
      case 's':
        cameraY--;
      break;
      case 'd':
        cameraX--;
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
      case 'x': case 'z':
        JSONObject out = new JSONObject();
        out.setInt("width", w);
        out.setInt("height", h);
        JSONArray outMap = new JSONArray();
        int c = 0;
        for(int i = 0; i < map.length; i++)
        {
          for(int j = 0; j < map[i].length; j++)
          {
            JSONObject entry = new JSONObject();
            entry.setInt("x", i);
            entry.setInt("y", j);
            entry.setString("tile", map[i][j]);
            outMap.setJSONObject(c, entry);
            c++;
          }
        }
        out.setJSONArray("map", outMap);
        saveJSONObject(out, NAME);
      break;
    }
  }
  else
  {
    if(key == BACKSPACE || key == DELETE)
    {
      map[x][y] = backspace(map[x][y]);
    }
    else
    {
      map[x][y] = map[x][y] + key;
    }
    lastTile = map[x][y];
  }
}

void resizeMap()
{
  if(w <= 0)
  {
    w = 0;
  }
  if(h <= 0)
  {
    h = 0;
  }
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

public String backspace(String str) {
    if (str != null && str.length() > 0) {
        str = str.substring(0, str.length() - 1);
    }
    return str;
}

public int alpabetize(char c)
{
  switch(c)
  {
    case 'a':
      return 0;
    case 'b':
      return 1;
    case 'c':
      return 2;
    case 'd':
      return 3;
    case 'e':
      return 4;
    case 'f':
      return 5;
    case 'g':
      return 6;
    case 'h':
      return 7;
    case 'i':
      return 8;
    case 'j':
      return 9;
    case 'k':
      return 10;
    case 'l':
      return 11;
    case 'm':
      return 12;
    case 'n':
      return 13;
    case 'o':
      return 14;
    case 'p':
      return 15;
    case 'q':
      return 16;
    case 'r':
      return 17;
    case 's':
      return 18;
    case 't':
      return 19;
    case 'u':
      return 20;
    case 'v':
      return 21;
    case 'w':
      return 22;
    case 'x':
      return 23;
    case 'y':
      return 24;
    case 'z':
      return 25;
    default:
      return 26;
  }
}
