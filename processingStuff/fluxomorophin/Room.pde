class Room
{
  PImage background;
  PImage midground;
  PImage foreground;
  
  Box[] ground;
  
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
    
  }
}
