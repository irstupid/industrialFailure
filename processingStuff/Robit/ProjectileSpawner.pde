class ProjectileSpawner
{
  Projectiles projectile;
  float fierate;
  float damageMulti;
  float rangeMulti;
  boolean good;

  float x;
  float y;
  float direction;

  int coolDown;
  ProjectileSpawner(Projectiles projectile, float fierate, float damageMulti, float rangeMulti, boolean good, float x, float y, float direction)
  {
    this.projectile = projectile;
    this.fierate = fierate;
    this.damageMulti = damageMulti;
    this.rangeMulti = rangeMulti;
    this.good = good;

    this.x = x;
    this.y = y;
    this.direction = direction;
  }

  void update()
  {
    if(coolDown > 0)
    {
      coolDown--;
    }
  }

  void spawn()
  {
    if(coolDown > 0)
    {
      return;
    }
    
    coolDown = round(60 * fierate);
    switch(projectile)
    {
      case SHOT:
      projectiles.add(new Shot(x, y, direction, rangeMulti, damageMulti));
      return;
      case RAY:
      return;
      case ORB:
      return;
      case MINE:
      return;
      default:
      return;
    }
  }

  void setPosition(float x, float y)
  {
    this.x = x;
    this.y = y;
  }

  void setDirection(float direction)
  {
    this.direction = direction;
  }
}
