class KeyPad
{
  String name;
  int score;
  Splat[] splats;
  int[] textColors; 
  
  KeyPad()
  {
    splats = new Splat[10];
    splats[0] = new Splat(200, 200, 1, false);
    splats[1] = new Splat(400, 200, 1, false);
    splats[2] = new Splat(600, 200, 1, false);
    splats[3] = new Splat(200, 400, 1, false);
    splats[4] = new Splat(400, 400, 1, false);
    splats[5] = new Splat(600, 400, 1, false);
    splats[6] = new Splat(200, 600, 1, false);
    splats[7] = new Splat(400, 600, 1, false);
    splats[8] = new Splat(600, 600, 1, false);
    
    textColors = new int[27];
    for(int i = 0; i < textColors.length - 1; i++)
    {
      textColors[i] = color(random(0, 255), 255, 255);
    }
  }
  
  void draw()
  {
    for(int i = 0; i < splats.length - 1; i++)
    {
      splats[i].draw();
    }
    push();
      textSize(128/2);
      fill(textColors[0]);
      text("a", 205, 195);
      fill(textColors[1]);
      text("b", 145, 203);
      fill(textColors[2]);
      text("c", 180, 251);
    pop();
  }
  
  void keyPressed()
  {
    
  }
}
