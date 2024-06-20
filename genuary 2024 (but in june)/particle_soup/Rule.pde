class Rule
{
  int typeA;
  int typeB;
  float g;
  
  Rule(int a, int b, float g)
  {
    this.typeA = a;
    this.typeB = b;
    this.g = g;
  }
  
  void draw()
  { 
    for(int i = 0; i < particles.size(); i++)
    {
      Particle a = particles.get(i);
      if(a.type == typeA)
      {
        for(int j = 0; j < particles.size(); j++)
        {
          Particle b = particles.get(j);
          if(b.type == typeB)
          {
            float dx = (a.x - b.x);
            float dy = (a.y - b.y);
            float d = sqrt(dx * dx + dy * dy);
            if(d > 0 && d < sight)
            {
              if(d > pushRange)
              {
                float f = g * -1/d;
                a.xV += f * dx * volatility * 0.1;
                a.yV += f * dy * volatility * 0.1;
              }
              else
              {
                float f = pushForce * 10/d;
                a.xV += f * dx * 0.05;
                a.yV += f * dy * 0.05;
              }
            }
          }
        }
      }
    }
  }
}
