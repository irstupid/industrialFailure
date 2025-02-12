static float[][] reactions = {
{1, -1, 0, 1},
{-1, 1, 0, 1},
{1, 1, 0, 1},
{0, 0, 0, 0}
};

class Acid
{
  float x = width/2;
  float y = width/2;
  float xV;
  float yV;
  Type type;
  
  Acid(int i)
  {
    type = Type.values()[i];
  }
  
  Acid(Type type)
  {
    this.type = type;
  }
  
  void clamp(Acid other)
  {
    float dX = x - other.x;
    float dY = y - other.y;
    float r = atan2(dY,dX);
    float d = dist(x, y, other.x, other.y);
    d = d - 25;
    x -= cos(r) * d;
    y -= sin(r) * d;
  }
  
  void collide(Acid other)
  {
    float d = dist(x, y, other.x, other.y);
    d = d - 25;
    if(d < 0)
    {
      float dX = x - other.x;
      float dY = y - other.y;
      float r = atan2(dY,dX);
      x -= cos(r) * d;
      y -= sin(r) * d;
    }
  }
  
  void add(Acid other)
  {
    float dX = (x - other.x) * 0.05;
    float dY = (y - other.y) * 0.05;
    float charge = reactions[type.ordinal()][other.type.ordinal()];
    xV = dX * charge;
    yV = dY * charge;
  }
  
  void move()
  {
    x += xV;
    y += yV;
    x += random(-0.5, 0.5);
    y += random(-0.5, 0.5);
  }
  
  void draw()
  {
    push();
      switch(type)
      {
        case AMPINE:
          fill(#ff0000);
          noStroke();
          circle(x, y, 50);
        break;
        case BITRINE:
          fill(#0033ff);
          circle(x, y, 50);
        break;
        case CHILINE:
          fill(#ffff00);
          noStroke();
          circle(x, y, 50);
        break;
        case DULCINE:
          fill(#ff00ff);
          noStroke();
          circle(x, y, 50);
        break;
      }
    pop();
  }
}

enum Type
{
  AMPINE,
  BITRINE,
  CHILINE,
  DULCINE
};
