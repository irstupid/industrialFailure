import java.io.FileInputStream;
import javazoom.jl.player.Player;

public class Sound extends Thread
{
    Player player;
    boolean play;

    Sound()
    {

    }

    @Override
    public void run() 
    {
        while(!isInterrupted())
        {
            try
            {
                if(play)
                {
                    player.play();
                }
            }
            catch(Exception e)
            {
                System.out.println("it died");
            }
        }
    }

    public void play()
    {
        play = true;
    }

    public void end()
    {
        play = false;
        player = null;
    }
    
    public void setSound(String name)
    {
        try
        {
            FileInputStream stream = new FileInputStream(name);
            player = new Player(stream);
        } 
        catch(Exception e)
        {
            System.err.println("your sound path is prob wrong");
        }
    }
}
