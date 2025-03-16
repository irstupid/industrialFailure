Map<Boolean> collisionMap;
Map<PImage> spriteMap;
Camera camera;

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
}

void draw()
{
  background(90);
  
  camera.setPosition(x, y);
  x += (mouseX - width/2)/100;
  y += (mouseY - height/2)/100;
  camera.draw();
}
