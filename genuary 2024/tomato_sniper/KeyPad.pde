class KeyPad
{
  String name;
  int score;
  Splat[] splats;
  int[] textColors; 
  int select;
  
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
    for(int i = 0; i < textColors.length - 1;)//textColors.length - 1;)
    {
      int c = color(random(0, 255), 255, 255);
      if(abs(splats[floor(i/3)].c - hue(c)) > 100)
      {
        textColors[i] = c;
        i++;
      }
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
      fill(textColors[3]);
      text("d", 405, 195);
      fill(textColors[4]);
      text("e", 345, 203);
      fill(textColors[5]);
      text("f", 380, 251);
      fill(textColors[0]);
      text("g", 605, 195);
      fill(textColors[1]);
      text("h", 545, 203);
      fill(textColors[2]);
      text("i", 580, 251);
      
      text("j", 205, 395);
      fill(textColors[1]);
      text("k", 145, 403);
      fill(textColors[2]);
      text("l", 180, 451);
      fill(textColors[3]);
      text("m", 405, 395);
      fill(textColors[4]);
      text("n", 345, 403);
      fill(textColors[5]);
      text("o", 380, 451);
      fill(textColors[0]);
      text("p", 605, 395);
      fill(textColors[1]);
      text("q", 545, 403);
      fill(textColors[2]);
      text("r", 580, 451);
      
      text("s", 205, 595);
      fill(textColors[1]);
      text("t", 145, 603);
      fill(textColors[2]);
      text("u", 180, 651);
      fill(textColors[3]);
      text("v", 405, 595);
      fill(textColors[4]);
      text("w", 345, 603);
      fill(textColors[5]);
      text("x", 380, 651);
      fill(textColors[0]);
      text("y", 605, 595);
      fill(textColors[1]);
      text("z", 545, 603);
      fill(textColors[2]);
      text("dlt", 550, 671);
    pop();
  }
  
  void keyPressed()
  {
    
  }
}
