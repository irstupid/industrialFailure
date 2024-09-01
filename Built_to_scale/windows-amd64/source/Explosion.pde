class Explosion
{
  float x;
  float y;
  float[] puffM;
  float[] puffV;
  float[] puffD;
  float[] puffR;
  float[] puffRV;
  PImage me;
  float scale = 1;
  
  int PUFFS = 30;
  
  Explosion(float x, float y)
  {
    me = puff;
    this.x = x;
    this.y = y;
    puffM = new float[PUFFS];
    puffV = new float[PUFFS];
    puffD = new float[PUFFS];
    puffR = new float[PUFFS];
    puffRV = new float[PUFFS];
    for(int i = 0; i < PUFFS; i++)
    {
      puffV[i] = random(1, 9);
      puffD[i] = random(0, TAU);
      puffRV[i] = random(-0.5, 0.5);
    }
  }
  
  void draw()
  {
    scale -= 0.01 * 1.2/scale;
    if(scale < 0.1)
    {
      explosions.remove(this);
      me.resize(200, 200);
    }
    push();
      scale(scale);
      for(int i = 0; i < PUFFS; i++)
      {
        puffM[i] += puffV[i];
        puffV[i] = puffV[i]/1.1;
        puffR[i] += puffRV[i];
        push();
            translate(x/scale, y/scale);
            translate(cos(puffD[i]) * puffM[i], sin(puffD[i]) * puffM[i]);
            rotate(puffR[i]);
            translate(-53 * scale, -143 * scale);
            image(me, 0, 0);
        pop();
      }
    pop();
  }
}
