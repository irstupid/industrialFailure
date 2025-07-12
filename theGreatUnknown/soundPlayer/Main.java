import java.awt.event.KeyEvent;
import javax.swing.JButton;

class Main
{
    static Frame frame;
    static Panel panel;
    static Sound sound;

    static boolean[] requests;
    public static void main(String[] args) 
    {
        requests = new boolean[1];

        frame = new Frame();
        panel = new Panel(frame);
        frame.setContentPane(panel);
        sound = new Sound();
        ActionHandler handler = new ActionHandler(requests);

        JButton playButton = new JButton("do something");
        playButton.setMnemonic(KeyEvent.VK_SPACE);
        playButton.setActionCommand("play");
        playButton.addActionListener(handler);
        frame.add(playButton);

        frame.pack();
        frame.setVisible(true);

        play();
        System.out.println("gothrough");
    }

    public static void play()
    {
        sound.play();
    }
}