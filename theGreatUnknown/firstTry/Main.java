import javax.swing.JFrame;

class Main implements Runnable
{
    static JFrame window;
    static Screen game;
    private Thread thread;

    final int FPS = 120;
    public static void main(String[] args)
    {
        window = new JFrame("game");
        game = new Screen(window);
        window.add(game);
        window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        window.pack();
        window.setLocationRelativeTo(null);
        window.setVisible(true);
    }

    public void start()
    {
        thread = new Thread(this);
        thread.start();
    }

    @Override
    public void run()
    {
        int timePerFrame = 1000000000/FPS;
        long lastFrame = 0;
        long now;

        while(true)
        {
            now = System.nanoTime();
            if(now - lastFrame >= timePerFrame)
            {
                game.update();
                lastFrame = now;
            }
        }
    }
}