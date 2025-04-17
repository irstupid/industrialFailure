import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.swing.JFrame;

public class Panel extends MotionPanel
{
    BufferedImage image;

    public Panel(JFrame parent) 
    {
        super(parent);
        try 
        {
            image = ImageIO.read(new File("bat.png"));
        } 
        catch (IOException e) 
        {
            throw(new NullPointerException("fuck you"));
        }
        setPreferredSize(new Dimension(image.getWidth(), image.getHeight()));
    }

    @Override
    protected void paintComponent(Graphics g)
    {
        g.drawImage(image, 0, 0, this);
    }
}
