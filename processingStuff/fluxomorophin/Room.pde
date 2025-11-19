class Room
{
  PImage background;
  PImage midground;
  PImage foreground;
  
  Box[] ground;
  
  boolean debug = false;
  
  Room(PImage background, PImage midground, PImage foreground, Box[] ground)
  {
    this.background = background;
    this.midground = midground;
    this.foreground = foreground;
    this.ground = ground;
  }
  
  Room(PImage background, PImage midground, Box[] ground)
  {
    this(background, midground, null, ground);
  }
  
  void draw()
  {
    if(background != null)
    {
      image(background, 0, 0, 1920, 1080);
    }
    if(midground != null)
    {
      image(midground, 0, 0, 1920, 1080);
    }
    if(foreground != null)
    {
      image(foreground, 0, 0, 1920, 1080);
    }
    
    if(debug)
    {
      for(int i = 0; i < ground.length; i++)
      {
        ground[i].debugDraw();
      }
    }
  }
}
