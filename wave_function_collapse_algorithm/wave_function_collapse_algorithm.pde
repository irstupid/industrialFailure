int[][][] tileData;
int[][][] tileDependencys;
PImage[] tiles;
PImage tileSet;

void setup()
{
  size(800, 800);
  tileSet = loadImage("tiles.png");
  makeTiles(32);
  //tileSet = loadImage("basic dungeon.png");
  //makeTiles(8);
}

void draw()
{
  
}

void makeTiles(int size)
{
  tiles = new PImage[tileSet.width + (tileSet.height * floor(tileSet.width/size))];
  
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

void TheAlmightyWaveFunctionCollapseAllogorithm()
{
  
}
