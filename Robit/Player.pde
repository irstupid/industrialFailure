class Player
{
    private float x;
    private float y;
    private int hp;
    private int xp;

    private float maxHp;
    private float speed;
    private float xpGain;

    private boolean left = false;
    private boolean right = false;
    private boolean up = false;
    private boolean down = false;

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
