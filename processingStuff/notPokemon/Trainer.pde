class Trainer
{
  int x;
  int y;
  int direction;
  int distance;
  int pattern;
  
  int time;
  
  Trainer(int x, int y, int direction, int distance, int pattern)
  {
    this.x = x;
    this.y = y;
    this.direction = direction;
    this.distance = distance;
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
      circle(x, y, TILEWIDTH);
      fill(#00ff00);
      if(direction == 0)
      {
        circle(x - 20, y, 10);
      }
      else if(direction == 1)
      {
        circle(x, y - 20, 10);
      }
      else if(direction == 2)
      {
        circle(x + 20, y, 10);
      }
      else
      {
        circle(x, y + 20, 10);
      }
    pop();
  }
  
  void see(int x, int y)
  {  //im gonna comment this part cause its confusing
    x = this.x - x; //transform reletive to the trainer
    y = this.y - y;
    x = abs(x);  //transform the resault to the positive quadrant
    y = abs(y);
    if(direction == 1 || direction == 3) //if were facing (up/down), switch x/y. this basically rotatets the space reletive to the trainer, so that everything is the same
    {
      int temp = x;
      x = y;
      y = temp;
    }
      //transformations (the hard part) are now complete
    if(x > distance) //if we are to far away, stop now
    {
      return;
    }
    y -= TILEHEIGHT/2; // account for the width of the player, it will always be subtraction because of the transformations
    if(y < TILEHEIGHT)  //final check, are we in the sight beam. once again the binary statement works because of transformations
    {
      println("I SEE YOU");
    }
    else
    {
      return;
    }
    //yo why transformations kinda cool though
  }
}
