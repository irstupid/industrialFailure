class Game implements Runnable
{
    Thread thread;
    Window window;
    Screen screen;
    Watermelon watermelon;

    public void start()
    {
        screen = new Screen();
        window = new Window(screen);

        watermelon = new Watermelon();
        watermelon.start();

        thread = new Thread(this);
        thread.start();
    }

    private void update()
    {
        System.out.println("poopoo");
        window.repaint();
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