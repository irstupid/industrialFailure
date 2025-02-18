Acid[] chain;

void setup()
{
  size(800, 800);
  
  chain = new Acid[3];
  chain[0] = new Acid(0);
  chain[1] = new Acid(2);
  chain[2] = new Acid(1);
}

void draw()
{
  for(int i = 0; i < chain.length; i++)
  {
    //for(int j = 0; j < chain.length; j++)
    //{
    //  if(abs(j - i) > 1)
    //  {
    //    chain[i].add(chain[j]);
    //  }
    //}
    chain[i].move();
    for(int j = i; true;)
    {
      int d = i - j;
      j += 1 + (d * 2);
      chain[j].clamp(chain[j - 1]);
      j -= 2 * (d + 1);
      chain[j].clamp(chain[j + 1]);
    }
  }
  
  background(#000022);
  for(int i = 0; i < chain.length; i++)
  {
    chain[i].draw();
  }
}

void keyPressed()
{
  
}

//for(int k = 0; k < chain.length; k++)
//      {
//        if(abs(j - k) > 1)
//        {
//          chain[]collide()
//        }
//        else
//        {
          
//        }
//      }
