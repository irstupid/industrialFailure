import java.awt.event.KeyEvent;
import javax.swing.JButton;

class Main
{
    static Frame frame;
    static Panel panel;
    static Sound sound;
    public static void main(String[] args) 
    {
        frame = new Frame();
        panel = new Panel(frame);
        frame.setContentPane(panel);
        sound = new Sound();
        sound.setSound("rickroll.mp3");
        ActionHandler handler = new ActionHandler(sound);

        JButton playButton = new JButton("do something");
        playButton.setMnemonic(KeyEvent.VK_SPACE);
        playButton.setActionCommand("play");
        playButton.addActionListener(handler);
        frame.add(playButton);

        JButton endButton = new JButton("KYS");
        endButton.setMnemonic(KeyEvent.VK_BACK_SPACE);
        endButton.setActionCommand("end");
        endButton.addActionListener(handler);
        frame.add(endButton);

        frame.pack();
        frame.setVisible(true);

        sound.start();
    }
}