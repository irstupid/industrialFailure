Map<Boolean> collisionMap;
Map<PImage> spriteMap;

JSONObject testRoute;

void setup()
{
  testRoute = loadJSONObject("testRoute.json");
  
  size(800, 800);
  collisionMap = new Map<Boolean>(testRoute)
  .add(true, "wall")
  .add(false, "open")
  .build();
  
  spriteMap = new Map<PImage>(testRoute)
  .add(loadImage("wall.png"), "wall")
  .add(loadImage("grass.png"), "open")
  .build();
}

void draw()
{
  background(90);
  
  push();
    for(int x = 0; x < spriteMap.getWidth(); x++)
    {
      int largestHeight = 0;
      push();
        for(int y = 0; y < spriteMap.getHeight(); y++)
        {
         PImage image = spriteMap.get(x, y);
         image(image, 0, 0);
         translate(image.width, 0);
         if(image.height > largestHeight)
         {
           largestHeight = image.height;
         }
        }
      pop();
      translate(0, largestHeight);
    }
  pop();
}
