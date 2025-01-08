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
        while(true)
        {
            game.update();
        }
    }
}