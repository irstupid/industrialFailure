class ProjectileSpawner
{
    Projectile projectile;

    float fierate;
    float damageMulti;
    float rangeMulti;
    boolean good;

    float x;
    float y;
    float direction;

    int coolDown;
    
    //public <T> T get(Class<? extends T> classOrInterface, String deviceName) {
      
    <T> ProjectileSpawner(Projectile projectile, float fierate, float damageMulti, float rangeMulti, boolean good, float x, float y, float direction)
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

        coolDown = 60 * fierate;
        //spawnProjectile
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
