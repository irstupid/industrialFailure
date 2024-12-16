class Player
{
    float x;
    float y;
    int hp;
    int xp;

    float maxHp;
    float speed;
    float xpGain;

    boolean left = false;
    boolean right = false;
    boolean up = false;
    boolean down = false;

    Player(float x, float y)
    {
        this.x = x;
        this.y = y;

        hp = maxHp;
        xp = 0;
    }

    void update()
    {

    }

    void paint()
    {

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
            break
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
            break
            case 's':
            down = false;
            break;
            case 'd':
            right = false;
            break;
        }
    }
}
