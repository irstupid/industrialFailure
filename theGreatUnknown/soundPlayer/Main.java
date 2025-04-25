import javax.swing.JButton;

class Main
{
    static Frame frame;
    static Panel panel;
    public static void main(String[] args) 
    {
        ActionHandler handler = new ActionHandler();
        frame = new Frame();
        panel = new Panel(frame);
        frame.setContentPane(panel);
        //frame.pack();

        JButton playButton = new JButton("do something");
        playButton.setMnemonic(KeyEvent.VK_SPACE);
        playButton.setActionCommand("play");
        playButton.addActionListener(handler);
        frame.add(playButton);

        frame.pack();
        frame.setVisible(true);
    }
}