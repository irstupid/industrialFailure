class Level
{
  Box[] platforms;
  ArrayList<Spell> spells;
  Player player;
  
  Level()
  {
    player = new Player();
    spells = new ArrayList<Spell>();
    platforms = new Box[3];
    platforms[0] = new Box(100, height/2, 200, 100);
    platforms[1] = new Box(width/2, height/2 + 100, width, 100);
    platforms[2] = new Box(width/2 + 200, height/2 - 50, 200, 50);
  }
  
  void draw()
  {
    background(90);
    for(int i = 0; i < platforms.length; i++)
    {
      platforms[i].draw();
    }
    player.draw();
    for(int i = 0; i < spells.size(); i++)
    {
      spells.get(i).draw();
    }
  }
  
  void update()
  {
    for(int i = 0; i < spells.size(); i++)
    {
      Spell spell = spells.get(i);
      spell.move();
      spell.collide(distance(spell.getX(), spell.getY()));
      if(spell.isDead())
      {
        spells.remove(spell);
      }
    }
    player.move();
    check();
    player.collide();
  }
  
  void check()
  {
    for(int i = 0; i < 8; i++)
    {
      player.setCheck(i, distance(player.CHECK_LOCATIONS[i][0] + player.getX() + player.WIDTH/2, player.CHECK_LOCATIONS[i][1] + player.getY() + player.HEIGHT/2));
    }
  }
  
  float distance(float x, float y)
  {
    float min = platforms[0].distance(x, y);
    for(int i = 1; i < platforms.length; i++)
    {
      min = min(min, platforms[i].distance(x, y));
    }
    return min;
  }
  
  void keyPressed()
  {
     player.keyPressed();
  }
    
  void keyReleased()
  {
    player.keyReleased();
  }
}
