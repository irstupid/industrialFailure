float tileWidth = 50;
float tileHeight = 50;

Map<Boolean> collisionMap;
Map<PImage> spriteMap;
Camera camera;
Player player;

JSONObject testRoute;

float x;
float y;

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
  
  camera = new Camera();
  camera.setMap(spriteMap);
  
  player = new Player(50, 50);
}

void draw()
{
  printArray(getCollisionTiles());
  camera.setCenter(player.getX(), player.getY());
  
  camera.move();
  background(90);
  camera.draw();
  player.draw();
}

void keyPressed()
{
  player.keyPressed();
}

void keyReleased()
{
  player.keyReleased();
}

boolean[] getCollisionTiles()
{
  int tileX = floor(((x - tileWidth/2) - (x - tileWidth/2) % (tileWidth * 2))/tileWidth);
  int tileY = floor(((y - tileHeight/2) - (y - tileHeight/2) % (tileHeight * 2))/tileHeight);
  return new boolean[] {
    collisionMap.get(tileX, tileY),
    collisionMap.get(tileX + 1, tileY),
    collisionMap.get(tileX + 1, tileY + 1),
    collisionMap.get(tileX, tileY + 1),
  };
}
