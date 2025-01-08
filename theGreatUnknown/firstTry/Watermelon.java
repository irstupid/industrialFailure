import java.awt.Graphics;
import java.awt.MouseInfo;
import java.awt.image.BufferedImage;
import java.awt.image.ImageObserver;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

public class Watermelon {

    final int WIDTH = 300;
    final int HEIGHT = 300;
    
    BufferedImage watermelon;
    int windowX;
    int windowY;

    int x;
    int y;
    int xV;
    int yV;

    public Watermelon() 
    {
        try
        {
            watermelon = ImageIO.read(new File("C:/Users/irbrost/Documents/GitHub/industrialFailure/theGreatUnknown/firstTry/Images/watermelon.png"));
        }
        catch(IOException error)
        {
            throw new NullPointerException("the watermelon image path is wrong");
        }
    }

    public void update()
    {
        int pX = x;
        int pY = y;
        x = MouseInfo.getPointerInfo().getLocation().x - windowX;
        y = MouseInfo.getPointerInfo().getLocation().y - windowY;
        xV = pX - x;
        yV = pY - y;
    }

    public void give(int windowX, int windowY) 
    {
        this.windowX = windowX;
        this.windowY = windowY;
    }
    
    public void draw(Graphics g, ImageObserver observer) 
    {
        g.drawImage(watermelon, x - watermelon.getWidth()/2, y - watermelon.getHeight()/2, observer);
    }

    float distance(float pX, float pY)
    {
        float t1 = Math.max(pX - x - WIDTH/2, 0);
        float t2 = Math.max(pY - y - HEIGHT/2, 0);
        return (float) Math.sqrt((t1 * t1) + (t2 * t2));
    }

    public float getX() { return x; }
    public float getY() { return y; }
    public float getXV() { return xV; }
    public float getYV() { return yV; }
}
