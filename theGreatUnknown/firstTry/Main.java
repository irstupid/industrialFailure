import javax.swing.JFrame;

class Main extends JFrame
{
    static JFrame window;
    static Screen game;
    public static void main(String[] args)
    {
        window = new JFrame("game");
        game = new Screen(window);
        window.add(game);
        window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        window.pack();
        window.setLocationRelativeTo(null);
        window.setVisible(true);
        long lastLoopTime = System.nanoTime();
        final int TARGET_FPS = 60;
        final long OPTIMAL_TIME = 1000000000 / TARGET_FPS;
        
        while (true) 
        {
            long now = System.nanoTime();
            long updateTime = now - lastLoopTime;
            lastLoopTime = now;
        
            float delta = updateTime / OPTIMAL_TIME;
        
            game.update(delta);
            window.repaint();
            System.out.println(delta);
        }
    }
}