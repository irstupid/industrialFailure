import javax.swing.*;

class Window extends JFrame
{
    public Window(Screen screen)
    {
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        add(screen);
        pack();
        setVisible(true);
    }
}