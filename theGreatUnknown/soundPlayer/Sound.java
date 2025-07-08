import java.io.File;
import java.io.FileInputStream;

import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;

import javazoom.jl.player.Player;

public class Sound
{
    Player player;

    Sound()
    {
        try
        {
            FileInputStream stream = new FileInputStream("rickRoll.mp3");
            player = new Player(stream);
        } 
        catch(Exception e)
        {
            System.err.println("your sound path is prob wrong");
        }
    }

    void play()
    {
        try
        {
        player.play();
        }
        catch(Exception e)
        {
            System.err.println("it no play");
        }
    }
}
