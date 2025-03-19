float tileWidth = 50;
float tileHeight = 50;

Map<Boolean> collisionMap;
Map<PImage> spriteMap;
Map<Float> speedMap;
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
  .add(false, "flowers")
  .add(false, "flower")
  .add(false, "floor")
  .build();
  
  spriteMap = new Map<PImage>(testRoute)
  .add(loadImage("wall.png"), "wall")
  .add(loadImage("grass.png"), "open")
  .add(loadImage("flowers.png"), "flowers")
  .add(loadImage("flower.png"), "flower")
  .add(loadImage("floor.png"), "floor")
  .build();
  
  speedMap = new Map<Float>(testRoute)
  .add(1f, "wall")
  .add(1f, "open")
  .add(0.75f, "flowers")
  .add(0.75f, "flower")
  .add(1.5f, "floor")
  .build();
  
  camera = new Camera();
  camera.setMap(spriteMap);
  
  player = new Player(50 * 13, 50 * 6);
}

void draw()
{
  //player.setSlowDown(getTileSlowdown());  //apply slow
  player.move();
  player.collide(getCollisionTiles());
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

float getTileSlowdown()
{
  float x = player.getX();
  float y = player.getY();
  int tileX = floor((x - x % tileWidth)/tileWidth);
  int tileY = floor((y - y % tileHeight)/tileHeight);
  float out = 0;
  out += speedMap.get(tileX, tileY);
  out += speedMap.get(tileX + 1, tileY);
  out += speedMap.get(tileX, tileY + 1);
  out += speedMap.get(tileX + 1, tileY + 1);
  out = out/4;
  return out;
}

boolean[] getCollisionTiles()
{
  float x = player.getX();
  float y = player.getY();
  int tileX = floor((x - x % tileWidth)/tileWidth);
  int tileY = floor((y - y % tileHeight)/tileHeight);
  return new boolean[] {
    collisionMap.get(tileX, tileY),
    collisionMap.get(tileX + 1, tileY),
    collisionMap.get(tileX + 1, tileY + 1),
    collisionMap.get(tileX, tileY + 1),
  };
}
