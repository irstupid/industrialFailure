class Projectile
{
    float x;
    float y;
    float speed;
    float direction;

    float damage;
    float range;
    float lifeTime;
    float size;
    int pierce;

    Projectile(float x, float y, float direction, float rangeMulti, float damageMulti)
    {
        this.x = x;
        this.y = y;
        this.direction = direction;
        damage = damageMulti;
        range = rangeMulti;
        start();
    }

    void start() { }

    void update()
    {
        x += Math.cos(direction) * speed;
        y += Math.sin(direction) * speed;
        if(pierce <= 0)
        {
            projectiles.remove(this);
        }
    }

    void paint()
    {
      
    }

    void Hit(float hX, float hY, float hR)
    {

    }
}

public enum Projectiles
{
  SHOT,
  RAY,
  ORB,
  MINE
}
