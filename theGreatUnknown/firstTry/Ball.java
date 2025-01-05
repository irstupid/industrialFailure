import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.awt.image.ImageObserver;
import java.io.File;
import java.io.IOException;
import java.time.*;
import java.util.Random;
import javax.imageio.ImageIO;

public class Ball {

    final float DRAG = 0.01f;
    final int SIZE = 66;

    private BufferedImage ball;
    private float x;
    private float y;
    private float xV = 1;
    private float yV;

    private int windowWidth;
    private int windowHeight;
    

    Random random = new Random();

    public Ball() 
    {
        try
        {
            ball = ImageIO.read(new File("C:/Users/irbrost/Documents/GitHub/industrialFailure/theGreatUnknown/firstTry/Images/ball.png"));
        }
        catch(IOException error)
        {
            throw new NullPointerException("the ball image path is wrong");
        }

        x = random.nextFloat() * 800;
        y = random.nextFloat() * 800;
    }

    public void update(Duration deltaTime)
    {
        x += xV * deltaTime.getNano();
        y += yV * deltaTime.getNano();
        //xV *= 1 - DRAG;
        //yV *= 1 - DRAG;

        if(x <= 0 + SIZE/2 || x >= windowWidth - SIZE/2)
        {
            x = Math.min(x, windowWidth);
            x = Math.max(x, 0);
            xV = -xV;
        }

        if(y <= 0 + SIZE/2 || y >= windowHeight - SIZE/2)
        {
            y = Math.min(y, windowHeight);
            y = Math.max(y, 0);
            yV = -yV;
        }
    }

    public void give(int width, int height)
    {
        windowWidth = width;
        windowHeight = height;
    }
    
    public void draw(Graphics g, ImageObserver observer) 
    {
        g.drawImage(ball, Math.round(x) - SIZE/2, Math.round(y) - SIZE/2, SIZE, SIZE, observer);
    }

    public void setXV(float value) { xV = value; }
    public void setYV(float value) { yV = value; }

    public float getX() { return x; }
    public float getY() { return y; }
    public float getXV() { return xV; }
    public float getYV() { return yV; }
    public float getRadius() { return SIZE/2; }
}
