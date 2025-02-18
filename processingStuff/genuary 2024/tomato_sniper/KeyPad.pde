class KeyPad
{
  String name;
  int score;
  Splat[] splats;
  int[] textColors; 
  int select = 0;
  
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
    for(int i = 0; i < textColors.length;)//textColors.length - 1;)
    {
      int c = color(random(0, 255), 255, 255);
      if(abs(splats[floor(i/3)].c - hue(c)) > 100)
      {
        textColors[i] = c;
        i++;
      }
    }
    
    splats[select] = new Splat(splats[select].x, splats[select].y, hue(#D5FF58), 1.5 ,false);
    textColors[select * 3] = 0;
    textColors[select * 3 + 1] = 0;
    textColors[select * 3 + 2] = 0;
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
      fill(textColors[6]);
      text("g", 605, 195);
      fill(textColors[7]);
      text("h", 545, 203);
      fill(textColors[8]);
      text("i", 580, 251);
      
      fill(textColors[9]);
      text("j", 205, 395);
      fill(textColors[10]);
      text("k", 145, 403);
      fill(textColors[11]);
      text("l", 180, 451);
      fill(textColors[12]);
      text("m", 405, 395);
      fill(textColors[13]);
      text("n", 345, 403);
      fill(textColors[14]);
      text("o", 380, 451);
      fill(textColors[15]);
      text("p", 605, 395);
      fill(textColors[16]);
      text("q", 545, 403);
      fill(textColors[17]);
      text("r", 580, 451);
      
      fill(textColors[18]);
      text("s", 205, 595);
      fill(textColors[19]);
      text("t", 145, 603);
      fill(textColors[20]);
      text("u", 180, 651);
      fill(textColors[21]);
      text("v", 405, 595);
      fill(textColors[22]);
      text("w", 345, 603);
      fill(textColors[23]);
      text("x", 380, 651);
      fill(textColors[24]);
      text("y", 605, 595);
      fill(textColors[25]);
      text("z", 545, 603);
      fill(textColors[26]);
      text("dlt", 550, 671);
    pop();
  }
  
  void keyPressed()
  {
    if(key == 'w' || key == 'a' || key == 's' || key == 'd')
    {
      splats[select] = new Splat(splats[select].x, splats[select].y, 1, false);
      for(int i = select * 3; i < select * 3 + 3;)//textColors.length - 1;)
      {
        int c = color(random(0, 255), 255, 255);
        if(abs(splats[floor(i/3)].c - hue(c)) > 100)
        {
          textColors[i] = c;
          i++;
        }
      }
      
      switch(key)
      {
        case 'w':
          select -= 3;
          break;
        case 'a':
          select -= 1;
          break;
        case 's':
          select += 3;
          break;
        case 'd':
          select += 1;
          break;
      }
      
      if(select < 0)
      {
        select += 9;
      }
      if(select > 8)
      {
        select -= 9;
      }
      
      splats[select] = new Splat(splats[select].x, splats[select].y, hue(#D5FF58), 1.5 ,false);
      textColors[select * 3] = 0;
      textColors[select * 3 + 1] = 0;
      textColors[select * 3 + 2] = 0;
    }
    else
    {
      switch(key)
      {
        case '1':
        switch(select)
        {
          case 0:
            name += "a";
          break;
          case 1:
            name += "d";
          break;
          case 2:
            name += "g";
          break;
          case 3:
            name += "j";
          break;
          case 4:
            name += "m";
          break;
          case 5:
            name += "p";
          break;
          case 6:
            name += "s";
          break;
          case 7:
            name += "v";
          break;
          case 8:
            name += "y";
          break;
        }
        break;
        case '2':
        switch(select)
        {
          case 0:
            name += "b";
          break;
          case 1:
            name += "e";
          break;
          case 2:
            name += "h";
          break;
          case 3:
            name += "k";
          break;
          case 4:
            name += "n";
          break;
          case 5:
            name += "q";
          break;
          case 6:
            name += "t";
          break;
          case 7:
            name += "w";
          break;
          case 8:
            name += "z";
          break;
        }
        break;
        case '3':
        switch(select)
        {
          case 0:
            name += "c";
          break;
          case 1:
            name += "f";
          break;
          case 2:
            name += "i";
          break;
          case 3:
            name += "l";
          break;
          case 4:
            name += "o";
          break;
          case 5:
            name += "r";
          break;
          case 6:
            name += "u";
          break;
          case 7:
            name += "x";
          break;
          case 8:
            name.replaceFirst(String.valueOf(name.charAt(name.length() - 1)), "");
          break;
        }
        break;
      }
    }
  }
}
