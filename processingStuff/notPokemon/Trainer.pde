class Trainer
{
  float x;
  float y;
  int direction;
  float distance;
  int pattern;
  
  int time;
  
  Trainer(int x, int y, int direction, int distance, int pattern)
  {
    this.x = x * TILEWIDTH;
    this.y = y * TILEHEIGHT;
    this.direction = direction;
    this.distance = distance * TILEWIDTH;
    this.pattern = pattern;
  }

  void update()
  {
    if(time  > 0)
    {
      time--;
    }
    else
    {
      switch(pattern)
      {
        case 1:
          time = 60;
          direction += 2;
          direction %= 4;
        break;
        case 2:
          time = 60;
          direction += 1;
          direction %= 4;
        break;
      }
    }
  }
  
  void draw()
  {
    push();
      translate(TILEWIDTH/2, TILEHEIGHT/2);
      circle(x, y, TILEWIDTH);
      fill(#00ff00);
      if(direction == 0)
      {
        circle(x - 20, y, 10);
      }
      else if(direction == 1)
      {
        circle(x, y + 20, 10);
      }
      else if(direction == 2)
      {
        circle(x + 20, y, 10);
      }
      else
      {
        circle(x, y - 20, 10);
      }
    pop();
  }
  
  void watch(float x, float y)
  {  //im gonna comment this part cause its confusing
    x = this.x - x; //transform reletive to the trainer
    y = this.y - y;
    if(direction == 1 || direction == 3) //if were facing (up/down), switch x/y. this basically rotatets the space reletive to the trainer, so that everything is the same
    {
      float temp = x;
      x = y;
      y = temp;
    }
    if(x/abs(x) == (direction == 1 || direction == 2 ? 1 : -1)) //if we are behind the trainer, stop
    {
      return;
    }
    x = abs(x);  //transform the resault to the positive quadrant
    y = abs(y);
      //transformations (the hard part) are now complete
    if(x > distance) //if we are to far away, stop now
    {
      return;
    }
    if(y < TILEHEIGHT)  //final check, are we in the sight beam. once again the binary statement works because of transformations
    {
      print("I SEE YOU");
    }
    else
    {
      return;
    }
    //yo why transformations kinda cool though
  }
}
