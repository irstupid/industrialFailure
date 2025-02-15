import java.io.IOException;

class Game implements Runnable 
{
    Thread thread;
    int state = 0;
    String pIn = "peepeepoopoo";

    Game()
    {
        thread = new Thread(this);
        thread.start();
    }

    void update() throws IOException
    {
        draw();
        pIn = Main.in;
    }

    void draw()
    {
        if(pIn.compareTo(Main.in) != 0)
        {
            System.out.print("> ");
        }
    }

    @Override
    public void run()
    {
        float timePerFrame = 1000000000/60;
        long lastFrame = System.nanoTime();

        while(true)
        {
            long now = System.nanoTime();
            if(now - lastFrame >= timePerFrame)
            {
                try
                {
                    update();
                }
                catch(IOException e)
                {
                    System.exit(0);
                }
                lastFrame = now;
            }
        }
    }
}