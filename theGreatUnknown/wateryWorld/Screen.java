import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import javax.swing.JPanel;

public class Screen extends JPanel
{
    Drawable[] queue;
    int queueLength = 0;

    public Screen()
    {
        setPreferredSize(new Dimension(800, 800));
        setBackground(new Color(0, 0, 0));
        queue = new Drawable[10];
    }

    @Override
    protected void paintComponent(Graphics g) 
    {
        super.paint(g);
        g.drawRect(100, 100, 100, HEIGHT);
        // for(; queueLength >= 0; queueLength--)
        // {
        //     queue[queueLength].draw(g, this);
        // }
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
