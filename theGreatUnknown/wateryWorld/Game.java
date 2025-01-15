class Game implements Runnable
{
    Thread thread;

    Game()
    {
        start();
    }

    private void start()
    {
        thread = new Thread(this);
        thread.start();
    }

    private void update()
    {
        System.out.println("poopoo");
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