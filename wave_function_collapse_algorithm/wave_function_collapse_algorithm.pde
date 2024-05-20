int[][][] tileData;
int[][][] tileDependencys;
PImage[] tiles;
PImage tileSet;

void setup()
{
  size(800, 800);
  tileSet = loadImage("tiles.png");
  makeTiles(32);
  fullWaveFunctionCollapseAlgorithmBecauseFuckMe();
  //loadTileDependencys("tiles[data].json");
  //tileSet = loadImage("basic dungeon.png");
  //makeTiles(8);
}

void draw()
{

}

void makeTiles(int size) //generate the array of images corosponding to tiles
{
  tiles = new PImage[(tileSet.height/size) * (tileSet.width/size)];
  
  for(int y = 0; y < tileSet.height/size; y++)
  {
    for(int x = 0; x < tileSet.width/size; x++)
    {
      PImage temp = new PImage();
      temp = tileSet.get(x * size, y * size, size, size);
      temp.resize(100, 100);
      tiles[x + (y * floor(tileSet.width/size))] = temp;
    }
  }
}

void fullWaveFunctionCollapseAlgorithmBecauseFuckMe() //do you every just wonder why you do these things to yourself
{
  tileDependencys = new int[tiles.length][4][];
  
  for(int i = 0; i < 1; i++)
  {
    PImage tile = tiles[i];
    int[] edges = new int[4];
    IntList temp = new IntList();
    
    tile.loadPixels();
    edges[0] = tile.pixels[0];
    edges[1] = tile.pixels[tile.width];
    edges[2] = tile.pixels[(tile.width * tile.height) - tile.width - 1];
    edges[3] = tile.pixels[(tile.width * tile.height) - 1];
    
    for(int j = 0; j < tiles.length; j++)
    {
      PImage tempTile = tiles[j];
      int[] tempEdges = new int[4];
      
      tempTile.loadPixels();
      tempEdges[0] = tile.pixels[0];
      tempEdges[1] = tile.pixels[tile.width];
      tempEdges[2] = tile.pixels[(tile.width * tile.height) - tile.width - 1];
      tempEdges[3] = tile.pixels[(tile.width * tile.height) - 1];
      
      println(tempEdges);
      
      if((edges[0] == tempEdges[0]) && (edges[1] == tempEdges[1]))
      {
        temp.append(j);
      }
    }
    println(temp);
  }
}

void loadTileDependencys(String name) //load tile data from a JSON
{
  JSONArray rawData = loadJSONArray(name);
  tileDependencys = new int[tiles.length][4][];
  for(int i = 0; i < tileDependencys.length; i++)
  {
    tileDependencys[i][0] = new int[rawData.getJSONObject(i).getInt("upAmount")];
    for(int j = 1; j - 1 < tileDependencys[i][0].length; j++)
    {
      tileDependencys[i][0][j - 1] = rawData.getJSONObject(i).getInt("up" + j);
    }
  }
}

void TheAlmightyWaveFunctionCollapseAllogorithm() //ALL PRAISE THE ALMIGHTY WAVE FUNCTION COLLAPSE ALGORITHM
{
  
}
