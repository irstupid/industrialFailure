class Main
{
    static Frame frame;
    static Panel panel;
    public static void main(String[] args) 
    {
        frame = new Frame();
        panel = new Panel(frame);
        frame.add(panel);
        frame.pack();
        frame.setVisible(true);
    }
}