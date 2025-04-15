
public class Enemy 
{
    int room = -1;
    int tick;

    int speed = 100;

    void update()
    {
        tick++;
        if(tick > speed)
        {
            if(Math.random() < 0.25)
            {
                move();
            }
            tick = 0;
        }

        // System.out.print((int) Math.round(Math.random()));
    }

    void move()
    {
        switch(room)
        {
            case -1:
                room = (int) Math.round(Math.random()) + 7;
            break;
            case 0:
                room = -1;
            break;
            case 1:
                room = (int) Math.round(Math.random()) * 3;
            break;
            case 2:
                room = (int) Math.round(Math.random()) * 4;
            break;
            case 3:
                room = -1;
            break;
            case 4:
                room = -1;
            break;
            case 5:
                room = (int) Math.round(Math.random()) + 2;
            break;
            case 6:
                room = (int) Math.round(Math.random()) + 3;
            break;
            case 7:
                room = 5;
            break;
            case 8:
                room = 6;
            break;
        }
        //System.out.println(getRoom());
    }

    String getRoom()
    {
        if(room == -1)
        {
            return "";
        }
        return Game.roomNames[room];  
    }
}