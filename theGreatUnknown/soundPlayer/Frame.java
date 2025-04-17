import java.awt.Color;
import javax.swing.*;

class Frame extends JFrame
{
    Frame()
    {
        super("soundPlayer");

        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setUndecorated(true);
        setBackground(new Color(0,0,0,1));
    }
}