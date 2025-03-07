Map map;

void setup()
{
  size(810, 810);
  Tile[] tiles = {
    new Tile(loadImage("grass.png"), false, false)
  };
  map = new Map(tiles);
}

void draw()
{
  map.draw(0, 0);
}
