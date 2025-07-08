import java.awt.event.KeyEvent;
import javax.swing.JButton;

class Main
{
    static Frame frame;
    static Panel panel;
    static Sound sound;
    public static void main(String[] args) 
    {
        ActionHandler handler = new ActionHandler();
        frame = new Frame();
        panel = new Panel(frame);
        frame.setContentPane(panel);
        //frame.pack();

        sound = new Sound();

        JButton playButton = new JButton("do something");
        playButton.setMnemonic(KeyEvent.VK_SPACE);
        playButton.setActionCommand("play");
        playButton.addActionListener(handler);
        frame.add(playButton);

        frame.pack();
        frame.setVisible(true);

        sound.play();
    }
}