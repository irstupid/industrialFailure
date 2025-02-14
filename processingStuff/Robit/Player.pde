class Player
{
    float x;
    float y;
    float r;
    int hp;
    int xp;

    int maxHp;
    float speed = 1;
    float xpGain;

    boolean left = false;
    boolean right = false;
    boolean up = false;
    boolean down = false;
    boolean shoot = false;
    
    ArrayList<ProjectileSpawner> projectiles;

    Player(float x, float y)
    {
        this.x = x;
        this.y = y;

        hp = maxHp;
        xp = 0;
        
        projectiles = new ArrayList<ProjectileSpawner>();
        projectiles.add(new ProjectileSpawner(Projectiles.SHOT, 1, 1, 1, true, x, y, 0));
    }

    void update()
    {
      move();
      for(int i = 0; i < projectiles.size(); i++)
      {
        projectiles.get(i).setPosition(x, y);
        projectiles.get(i).setDirection(r);
        projectiles.get(i).update();
        if(shoot)
        {
          projectiles.get(i).spawn();
        }
      }
    }
    
    void move()
    {
      int yD = (up ? -1 : 0) + (down ? 1 : 0);
      int xD = (left ? -1 : 0) + (right ? 1 : 0);
      if(up || down || left || right)
      {
        r = atan2(yD, xD);
      }
      x += xD * speed;
      y += yD * speed;
    }

    void paint()
    {
      push();
        rectMode(CENTER);
        rect(x, y, 50, 50);
      pop();
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
            case '1': case' ':
            shoot = true;
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
            case '1': case' ':
            shoot = false;
            break;
        }
    }
}
