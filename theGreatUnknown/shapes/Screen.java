import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.swing.*;

public class Screen extends JPanel{

    int windowX;
    int windowY;
    int mouseX;
    int mouseY;
    BufferedImage watermelon;

    public Screen()
    {
        setPreferredSize(new Dimension(800, 800));
        setBackground(new Color(5, 10, 40));   
        try
        {
            watermelon = ImageIO.read(new File("C:/Users/irbrost/Documents/GitHub/industrialFailure/theGreatUnknown/shapes/Images/watermelon.png"));
        }
        catch(IOException error)
        {
            System.out.println("oh no");
        }
    }

    public void giveWindow(int x, int y)
    {
        windowX = x;
        windowY = y;
    }
    
    @Override
    protected void paintComponent(Graphics g) {

        mouseX = MouseInfo.getPointerInfo().getLocation().x;
        mouseX = mouseX - windowX;
        mouseY = MouseInfo.getPointerInfo().getLocation().y;
        mouseY = mouseY - windowY;

        super.paintComponent(g);
        g.drawImage(watermelon,mouseX - watermelon.getWidth()/2, mouseY - watermelon.getHeight()/2, this);      
    }

}
