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
      for(int i = 0; i < carrots.size(); i++)
      {
        if(carrots.get(i).unHit < 0 && dist(carrots.get(i).x, carrots.get(i).y, x, y) < 40)
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
    if(key == 'o' || key == '3')
    {
      if(state == 1)
      {
        state = 0;
        explosions.add(new Explosion(x, y));
        poof.play();
      }
      else
      {
        x = player.x;
        y = player.y;
        ponk.play();
        state = 1;
      }
    }
  }
}
