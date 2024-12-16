class Player
{
    float x;
    float y;
    int hp;
    int xp;

    int maxHp;
    float speed;
    float xpGain;

    boolean left = false;
    boolean right = false;
    boolean up = false;
    boolean down = false;
    
    ArrayList<ProjectileSpawner> projectiles;

    Player(float x, float y)
    {
        this.x = x;
        this.y = y;

        hp = maxHp;
        xp = 0;
        
        projectiles = new ArrayList<ProjectileSpawner>();
        projectiles.add(new ProjectileSpawner<Shot>(1, 1, 1, true, x, y, 0));
    }

    void update()
    {
      
      for(int i = 0; i < projectiles.size(); i++)
      {
        projectiles.get(i).setPosition(x, y);
        projectiles.get(i).update();
        projectiles.get(i).spawn();
      }
    }

    void paint()
    {
      rectMode(CENTER);
      rect(x, y, 50, 50);
    }

    void keyPressed()
    {
        switch(key)
        {
            case 'w':
            up = true;
            break;
            case 'a':
            left = true;
            break;
            case 's':
            down = true;
            break;
            case 'd':
            right = true;
            break;
        }
    }

    void keyReleased()
    {
        switch(key)
        {
            case 'w':
            up = false;
            break;
            case 'a':
            left = false;
            break;
            case 's':
            down = false;
            break;
            case 'd':
            right = false;
            break;
        }
    }
}
