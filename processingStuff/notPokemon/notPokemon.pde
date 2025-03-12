Map<Boolean> map;

JSONObject testRoute;

void setup()
{
  testRoute = loadJSONObject("testRoute.json");
  
  size(800, 800);
  map = new Map<Boolean>()
  .add(true, "wall")
  .add(false, "open");
  
  print(map.getLibrary("open"));
}

void draw()
{
  
}
