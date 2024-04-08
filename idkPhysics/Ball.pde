class Ball
{
  float x;
  float y;
  float d;
  float v;
  float s;
  
  
  int c;
  float[] waves;
  
  Ball()
  {
    x = width/2;
    y = height/2;
    s = 10;
    c = 0;
    waves = new float[10];
    for(int i = 0; i < waves.length; i++)
    {
      waves[i] = ((float) (i + 1)/waves.length) * s;
      println(waves[i]);
    }
    
  }
  
  void draw()
  {
    ball(x, y, s, c);
    c++;
    if(c >= 255)
    {
      c = 0;
    }
  }
  
  void ball(float x, float y, float s, int c)
  {
    push();
      translate(x, y);
      //scale(s, s);
      for(int i = waves.length - 1; i > -1; i--)
      {
        stroke(color((waves[i]/s * 255)/2 + c/2, 100, 100));
        strokeWeight(5);
        noFill();
        circle(0, 0, waves[i] * 10);
        waves[i] += 0.1;
        if(waves[i] > s)
        {
          waves[i] = 0;
        }
      }
   pop();
  }
}
