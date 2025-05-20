class World
{ 
  Map<Boolean> collisionMap;
  Map<PImage> spriteMap;
  Map<Float> speedMap;
  HashMap<Integer, Warp> warpLookup;
  HashMap<Integer, String> descriptionLookup;
  Trainer[] trainers;
  Camera camera;
  Player player;
  
  boolean interact;
  String currentText;
  
  World()
  {
    camera = new Camera();
    load("testRoute.json", 13, 6);
  }
  
  void load(String name, int x, int y)
  {
    JSONObject route = loadJSONObject(name);
    
    warpLookup = new HashMap<>();
    descriptionLookup = new HashMap<>();
    JSONArray warps = route.getJSONArray("warps");
    for(int i = 0; i < warps.size(); i++)
    {
      JSONObject warp = warps.getJSONObject(i);
      warpLookup.put(pair(warp.getInt("x"), warp.getInt("y")), new Warp(warp.getInt("dX"), warp.getInt("dY"), warp.getString("location")));
    }
    JSONArray descriptions = route.getJSONArray("descriptions");
    for(int i = 0; i < descriptions.size(); i++)
    {
      JSONObject description = descriptions.getJSONObject(i);
      descriptionLookup.put(pair(description.getInt("x"), description.getInt("y")), description.getString("description"));
    }
    
    JSONArray trainersRaw = route.getJSONArray("trainers");
    trainers  = new Trainer[trainersRaw.size()];
    for(int i = 0; i < trainers.length; i++)
    {
      JSONObject trainer = trainersRaw.getJSONObject(i);
      trainers[i] = new Trainer(trainer.getInt("x"), trainer.getInt("y"), trainer.getInt("direction"), trainer.getInt("distance"), trainer.getInt("pattern"));
    }
    
    collisionMap = new Map<Boolean>(route)
    .add(true, "wall")
    .add(false, "open")
    .add(false, "flowers")
    .add(false, "flower")
    .add(false, "floor")
    .add(false, "door")
    .add(true, "watermelon")
    .build();
    
    spriteMap = new Map<PImage>(route)
    .add(loadImage("wall.png"), "wall")
    .add(loadImage("grass.png"), "open")
    .add(loadImage("flowers.png"), "flowers")
    .add(loadImage("flower.png"), "flower")
    .add(loadImage("floor.png"), "floor")
    .add(loadImage("door.png"), "door")
    .add(loadImage("watermelon.png"), "watermelon")
    .build();
    
    speedMap = new Map<Float>(route)
    .add(1f, "wall")
    .add(1f, "open")
    .add(0.75f, "flowers")
    .add(0.75f, "flower")
    .add(1.5f, "floor")
    .add(1.5f, "door")
    .add(1f, "watermelon")
    .build();
    
    camera.setMap(spriteMap);
    player = new Player(TILEWIDTH * x, TILEHEIGHT * y);
  }
  
  void draw()
  {
    push();
      camera.move();
      background(90);
      camera.draw();
      player.draw();
      for(int i = 0; i < trainers.length; i++)
      {
        trainers[i].draw();
      }
      fill(#00ff00, 100);
      rect(player.getTileX() * TILEWIDTH, player.getTileY() * TILEHEIGHT, TILEWIDTH, TILEHEIGHT);
    pop();
  }
  
  void update()
  {
    //player.setSlowDown(getTileSlowdown());
    warp();
    for(int i = 0; i < trainers.length; i++)
    {
      trainers[i].update();
      trainers[i].watch(player.getX(), player.getY());
    }
    if(currentText.equals(""))
    {
      player.move();
      player.direct();
    }
    player.collide(getCollisionTiles());
    camera.setCenter(player.getX(), player.getY());
    describe();
  }
  
  void keyPressed()
  {
    player.keyPressed();
    if(key == '1' && currentText.equals(""))
    {
      interact = true;
    }
  }
  
  void keyReleased()
  {
    player.keyReleased();
    if(key == '1')
    {
      interact = false;
    }
  }
  
  void warp()
  {
    int x = round(player.getX()/TILEWIDTH);
    int y = round(player.getY()/TILEHEIGHT);
    Warp warp = warpLookup.get(pair(x, y));
    if(warp != null)
    {
      load(warp.location, warp.x, warp.y);
    }
  }
  
  String describe()
  {
    if(interact)
    {
      int x = round(player.getX()/TILEWIDTH);
      int y = round(player.getY()/TILEHEIGHT);
      if(player.getDirection() == 0)
      {
        x--;
      }
      else if(player.getDirection() == 1)
      {
        y--;
      }
      else if(player.getDirection() == 2)
      {
        x++;
      }
      else
      {
        y++;
      }
      String description = descriptionLookup.get(pair(x, y));
      return description;
    }
    else
    {
      return null;
    }
  }
  
  void giveText(String text)
  {
    currentText = text;
  }
  
  int pair(int a, int b)
  {
    return a + b * 10000;
  }
  
  float getTileSlowdown()
  {
    float x = player.getX();
    float y = player.getY();
    int tileX = floor((x - x % TILEWIDTH)/TILEWIDTH);
    int tileY = floor((y - y % TILEHEIGHT)/TILEHEIGHT);
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
    int tileX = floor((x - x % TILEWIDTH)/TILEWIDTH);
    int tileY = floor((y - y % TILEHEIGHT)/TILEHEIGHT);
    return new boolean[] {
      collisionMap.get(tileX, tileY),
      collisionMap.get(tileX + 1, tileY),
      collisionMap.get(tileX + 1, tileY + 1),
      collisionMap.get(tileX, tileY + 1),
    };
  }
}
