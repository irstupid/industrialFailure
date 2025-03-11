Map<Boolean> map;

void setup()
{
  size(800, 800);
  map = new Map<Boolean>()
  .add(true, "wall")
  .add(false, "open");
  
  print(map.getLibrary("wall"));
}

void draw()
{
  
}
