import java.awt.Graphics;
import java.awt.image.ImageObserver;

public interface Drawable 
{
    public void draw(Graphics g, ImageObserver observer);
}
