
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.awt.image.ImageObserver;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

public class Watermelon implements Drawable
{
    BufferedImage watermelon;
    int x;
    int y;

    public void start()
    {
        try
        {
            watermelon = ImageIO.read(new File("C:/Users/irbrost/Documents/GitHub/industrialFailure/theGreatUnknown/wateryWorld/Images/watermelon.png"));
        }
        catch(IOException error)
        {
            throw new NullPointerException("the watermelon image path is wrong");
        }
    }

    @Override
    public void draw(Graphics g, ImageObserver observer)
    {
        g.drawImage(watermelon, x - watermelon.getWidth()/2, y - watermelon.getHeight()/2, observer);
    }
}