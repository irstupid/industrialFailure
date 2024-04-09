class Ball
{
  float x;
  float y;
  float d;
  float v;
  float s;
  
  int t;
  
  int c;
  float[] waves;
  int[] colors;
  
  Ball()
  {
    x = width/2;
    y = height/2;
    s = 10;
    c = 0;
    v = 10;
    d = radians(90);
    
    waves = new float[10];
    for(int i = 0; i < waves.length; i++)
    {
      waves[i] = ((float) (i + 1)/waves.length) * s;
      //println(waves[i]);
    }
    colors = new int[waves.length];
    for(int i = 0; i < colors.length; i++)
    {
      colors[i] = round(((float) (i + 1)/colors.length) * 255);
      println(colors[i]);
    }
    
  }
  
  void draw()
  {
    t++;
    x += sin(d) * v;
    y += cos(d) * v;
    
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
      noStroke();
      fill(color(c, (c >= 150 && c <= 200 ? 75 : 100), 75 + (((float) c/225) * 25)));
      circle(0, 0, s * 10);
      for(int i = waves.length - 1; i > -1; i--)
      {
        stroke(color(colors[i], 100, 100));
        strokeWeight(3);
        noFill();
        circle(noise(waves[i] + t) * 3, noise(waves[i] - t) * 3, waves[i] * 10);
        waves[i] += 0.1;
        if(waves[i] > s)
        {
          waves[i] = 0;
        }
      }
   pop();
  }
}
