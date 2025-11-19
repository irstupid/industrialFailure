ScaleFrame scaleFrame;
Room testRoom;

void setup()
{
  size(1920/2, 1080/2);
  scaleFrame = new ScaleFrame(1920, 1080);
  
  Box[] testGround = {new Box(0, 1080 - 100, 1920, 1080, Box.CORNER_CORNER)};
  testRoom = new Room(loadImage("testBackground.png"), loadImage("testMidground.png"), testGround);
}

void draw()
{
  scaleFrame.transform();
  background(#000000);
  testRoom.draw();
  scaleFrame.border();
}
