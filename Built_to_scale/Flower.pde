class Flower
{
  float x;
  float y;
  PImage me;
  int state;
  
  Flower()
  {
    me = loadImage("flower.png");
    me.resize(400, 400);
  }
  
  void draw()
  {
    if(state == 1)
    {
      for(int i = 0; i < enemys.size(); i++)
      {
        if(enemys.get(i).distance(x, y) < 25)
        {
          state = 0;
          explosions.add(new Explosion(x, y));
        }
      }
      for(int i = 0; i < carrots.size(); i++)
      {
        if(dist(carrots.get(i).x, carrots.get(i).y, x, y) < 40)
        {
          state = 0;
        }
      }
      
      push();
        fill(#ff0000, 100);
        circle(x, y, 200);
      pop();
      push();
        translate(x, y);
        rotate(0);
        translate(-210, -184);
        image(me, 0, 0);
      pop();
    }
  }
  
  void keyPressed()
  {
    if(key == 'o')
    {
      if(state == 1)
      {
        state = 0;
        explosions.add(new Explosion(x, y));
      }
      else
      {
        x = player.x;
        y = player.y;
        state = 1;
      }
    }
  }
}
