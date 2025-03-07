class Tile
{
  PImage sprite;
  Boolean wall;
  Boolean grass;
  
  Tile(PImage sprite, Boolean wall, Boolean grass)
  {
    this.sprite = sprite;
    this.wall = wall;
    this.grass = grass;
  }
}
