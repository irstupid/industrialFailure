import java.time.*;
import javax.swing.JFrame;

class Main
{
    static JFrame window;
    static Screen game;
    
    public static Duration deltaTime = Duration.ZERO;
    public static void main(String[] args)
    {
        window = new JFrame("game");
        game = new Screen(window);
        window.add(game);
        window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        window.pack();
        window.setLocationRelativeTo(null);
        window.setVisible(true);

        Instant beginTime = Instant.now();
        while(true){

            game.update(deltaTime);

            deltaTime = Duration.between(beginTime, Instant.now());
        }
    }
}