import java.awt.*;
import javax.swing.*;

class Window extends JPanel
{
    JFrame window;
    Drawable[] queue;
    int queueLength = 0;

    Window()
    {
        start();
    }

    private void start()
    {
        setPreferredSize(new Dimension(800, 800));
        setBackground(new Color(5, 10, 40)); 
        window = new JFrame("game");
        window.add(this);
        window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        window.pack();
        window.setLocationRelativeTo(null);
        window.setVisible(true);
        queue = new Drawable[10];
    }

    @Override
    protected void paintComponent(Graphics g) 
    {
        System.out.println("poopoo");
        super.paint(g);
        for(; queueLength >= 0; queueLength--)
        {
            queue[queueLength].draw(g, this);
        }
    }

    public void add(Drawable thing)
    {
        if(queueLength > queue.length)
        {
            throw new NullPointerException("to many drawables in queue");
        }
        queue[queueLength] = thing;
        queueLength++;
    }
}