import javax.swing.*;

public class Screen {

    JFrame screen;

    public Screen()
    {
        screen = new JFrame("game");
        screen.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        screen.setSize(500, 600);
        screen.setVisible(true);
    }

    public void update()
    {
        screen.setBackground(new Color(0, 0, 0));
    }
}
