class Shot extends Projectile
{
  Shot(float x, float y, float direction, float rangeMulti, float damageMulti)
  {
    super(x, y, direction, rangeMulti, damageMulti);
  }
  
  void start()
  {
    damage = damage * 1;
    speed = 5 * range;
    lifeTime = 30 + (range - 1) * 10;
    size = 1;
    pierce = 1;
  }

  void paint()
  {
    circle(x, y, 10);
  }

  boolean hit(float hX, float hY, float hR)
  {
    if(dist(hX, hY, x, y) <= hR + 5 && pierce > 0)
    {
      pierce--;
      return true;
    }
    else
    {
      return false;
    }
  }
}
