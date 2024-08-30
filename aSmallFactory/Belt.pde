class Belt
{
  int x;
  int y;
  int type  = 7;
  PVector connect;
  PImage sheet;
  
  Belt(int x, int y, PVector connect)
  {
    sheet = loadImage("convayer.png");
    this.x = x;
    this.y = y;
    this.connect = connect;

  }
  
  void draw()
  {
    
    switch(type)
    {
      case 1:
        image(sheet, x * scale, y * scale, scale, scale, 80 * 0, 0, 80 * 1, 80);
        break;
      case 2:
        image(sheet, x * scale, y * scale, scale, scale, 80 * 1, 0, 80 * 2, 80);
        break;
      case 3:
        image(sheet, x * scale, y * scale, scale, scale, 80 * 2, 0, 80 * 3, 80);
        break;
      case 4:
        image(sheet, x * scale, y * scale, scale, scale, 80 * 3, 0, 80 * 4, 80);
        break;
      case 5:
        image(sheet, x * scale, y * scale, scale, scale, 80 * 4, 0, 80 * 5, 80);
        break;
      case 6:
        image(sheet, x * scale, y * scale, scale, scale, 80 * 5, 0, 80 * 6, 80);
        break;
      case 7:
        image(sheet, x * scale, y * scale, scale, scale, 80 * 6, 0, 80 * 7, 80);
        break;
      case 8:
        image(sheet, x * scale, y * scale, scale, scale, 80 * 7, 0, 80 * 8, 80);
        break;
      case 9:
        image(sheet, x * scale, y * scale, scale, scale, 80 * 8, 0, 80 * 9, 80);
        break;
      case 10:
        image(sheet, x * scale, y * scale, scale, scale, 80 * 9, 0, 80 * 10, 80);
        break;
      case 11:
        image(sheet, x * scale, y * scale, scale, scale, 80 * 10, 0, 80 * 11, 80);
        break;
      case 12:
        image(sheet, x * scale, y * scale, scale, scale, 80 * 11, 0, 80 * 12, 80);
        break;
    }
  }
}

// alt convayer
/*push();
      rectMode(CORNER);
      noStroke();
      fill(#555555);
      rect(x * scale, y * scale, scale, scale);
      
      stroke(#aaaaaa);
      for(int i = 0; i <= 5; i++)
      {
        if(connect.y == 1 || connect.y == 3)
        {
          line((x * scale) + (scale/5 * i), y * scale, (x * scale) + (scale/5 * i), y * scale + scale);
        }
        else
        {
          line(x * scale, (y * scale) + (scale/5 * i), x * scale + scale, (y * scale) + (scale/5 * i));
        }
      }
      pop();
//old code
/* if(connect.y == 1 || connect.y == 3)
      {
        for(int i = 0 + (connect.y == 1 ? 0 : 1); i < 5 + (connect.y == 1 ? 0 : 1); i++)
        {
          line((x * scale) + (scale/5 * i) + (5 * (connect.y == 1 ? 1 : -1)), y * scale, (x * scale) + (scale/5 * i) + (20 * (connect.y == 1 ? 1 : -1)), y * scale + scale/2);
        }
        for(int i = 0 + (connect.y == 1 ? 0 : 1); i < 5 + (connect.y == 1 ? 0 : 1); i++)
        {
          line((x * scale) + (scale/5 * i) + (20 * (connect.y == 1 ? 1 : -1)), y * scale + scale/2, (x * scale) + (scale/5 * i) + (5 * (connect.y == 1 ? 1 : -1)), y * scale + scale);
        }
      }
      else
      {
        for(int i = 0 + (connect.y == 2 ? 0 : 1); i < 5 + (connect.y == 2 ? 0 : 1); i++)
        {
          line(x * scale, (y * scale) + (scale/5 * i) + (5 * (connect.y == 2 ? 1 : -1)), x * scale + scale/2, (y * scale) + (scale/5 * i) + (20 * (connect.y == 2 ? 1 : -1)));
          //line((x * scale) + (scale/5 * i) + (5 * (connect.y == 1 ? 1 : -1)), y * scale, (x * scale) + (scale/5 * i) + (20 * (connect.y == 1 ? 1 : -1)), y * scale + scale/2);
        }
        for(int i = 0 + (connect.y == 2 ? 0 : 1); i < 5 + (connect.y == 2 ? 0 : 1); i++)
        {
          line(x * scale + scale/2, (y * scale) + (scale/5 * i) + (20 * (connect.y == 2 ? 1 : -1)), x * scale + scale, (y * scale) + (scale/5 * i) + (5 * (connect.y == 2 ? 1 : -1)));
          //line((x * scale) + (scale/5 * i) + (20 * (connect.y == 1 ? 1 : -1)), y * scale + scale/2, (x * scale) + (scale/5 * i) + (5 * (connect.y == 1 ? 1 : -1)), y * scale + scale);
        }
       } */
