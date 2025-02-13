class Game implements Runnable
{
    Thread thread;
    Window window;

    Game()
    {
        start();
    }

    private void start()
    {
        window = new Window();

        thread = new Thread(this);
        thread.start();
    }

    private void update()
    {
        
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
                update();
                lastFrame = now;
            }
        }
    }
}