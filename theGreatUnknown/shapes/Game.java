import javax.swing.JFrame;

public class Game
{
    public JFrame window;
    Screen screen;

    public Game()
    {
        screen = new Screen();
        window = new JFrame("game");
        window.add(screen);
        window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        window.pack();
        window.setLocationRelativeTo(null);
        window.setVisible(true);
    }

    public void update()
    {
        screen.giveWindow(window.getX(), window.getY());
        screen.repaint();
    }
}