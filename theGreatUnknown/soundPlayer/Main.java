import javax.swing.JButton;

class Main
{
    static Frame frame;
    static Panel panel;
    public static void main(String[] args) 
    {
        frame = new Frame();
        panel = new Panel(frame);
        frame.setContentPane(panel);
        //frame.pack();

        JButton playButton = new JButton();
        frame.add(playButton);

        frame.pack();
        frame.setVisible(true);
    }
}