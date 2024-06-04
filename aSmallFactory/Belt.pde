class Belt
{
  int x;
  int y;
  PVector connect;
  
  Belt(int x, int y, PVector connect)
  {
    this.x = x;
    this.y = y;
    this.connect = connect;
  }
  
  void draw()
  {
    if(abs(connect.x - connect.y) == 2)
    {
      push();
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
    }
    else
    {
      push();
      fill(#555555);
      noStroke();
      arc(x * scale, y * scale, scale * 2, scale * 2, 0, HALF_PI);
      pop();
    }
  }
}

// alt convayer
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
