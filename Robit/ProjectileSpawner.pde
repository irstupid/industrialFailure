class ProjectileSpawner <T extends Projectile>
{
  float fierate;
  float damageMulti;
  float rangeMulti;
  boolean good;

  float x;
  float y;
  float direction;

  int coolDown;
  ProjectileSpawner(float fierate, float damageMulti, float rangeMulti, boolean good, float x, float y, float direction)
  {
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

  T spawn()
  {
    if(coolDown > 0)
    {
      return null;
    }
    
    coolDown = round(60 * fierate);
    return T.factory(1, 1, 1, 1, 1);
    println("pew");
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
