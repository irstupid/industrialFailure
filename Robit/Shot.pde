class Shot extends Projectile
{
  Shot()
  {
    super();
  }
  
  void start()
  {
    damage = damage * 1;
    speed = 5 * range;
    lifeTime = 30 + (range - 1) * 10;
    size = 1;
    peirce = 1;
  }

  void paint()
  {
    circle(x, y, 10);
  }

  boolean hit(float hX, float hY, float hR)
  {
    if(dist(Hx, Hy, x, y) <= HR + 5 && peirce > 0)
    {
      peirce--;
      return true;
    }
    else
    {
      return false;
    }
  }
}
