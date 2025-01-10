import java.awt.*;
import javax.swing.*;

public class Screen extends JPanel
{

    Watermelon watermelon;
    JFrame window;
    Ball[] balls; //haha

    public Screen(JFrame window)
    {
        this.window = window;
        setPreferredSize(new Dimension(800, 800));
        setBackground(new Color(5, 10, 40));   

        watermelon = new Watermelon();

        balls = new Ball[2];
        for(int i = 0; i < balls.length; i++)
        {
            balls[i] = new Ball();
        }
    }

    public void update()
    {
        watermelon.give(window.getX(), window.getY());
        watermelon.update();
        for(int i = 0; i < balls.length; i++)
        {
            balls[i].give(window.getWidth(), window.getHeight());
            balls[i].update();
        }

        collide();
    }

    private void collide()
    {
        for(int i = 0; i < balls.length; i++)
        {
            Ball ball = balls[i];
            if(watermelon.distance(ball.getX(), ball.getY()) <= ball.getRadius())
            {
                //System.out.println("hit");
                //ball.setXV(watermelon.getXV());
                //ball.setYV(watermelon.getYV());
                // float dx = ball.getX() - watermelon.getX();
                // float dy = ball.getY() - watermelon.getY();
                // if(Math.abs(dx) > Math.abs(dy))
                // {
                //     ball.setXV(ball.getXV() - watermelon.getXV());
                //     ball.setYV(-ball.getYV() - watermelon.getYV());
                // }
                // else
                // {
                //     ball.setXV(-ball.getXV() - watermelon.getXV());
                //     ball.setYV(ball.getYV() - watermelon.getYV());
                // }
            }
        }
    }

    @Override
    protected void paintComponent(Graphics g) 
    {
        super.paintComponent(g);
        watermelon.draw(g, this);
        for(int i = 0; i < balls.length; i++)
        {
            balls[i].draw(g, this);
        }
    }
}
