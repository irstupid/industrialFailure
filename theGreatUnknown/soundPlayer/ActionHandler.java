
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class ActionHandler implements ActionListener
{
    Sound sound;

    ActionHandler(Sound sound)
    {
        this.sound = sound;
    }

    @Override
    public void actionPerformed(ActionEvent e) 
    {
        if("play".equals(e.getActionCommand()))
        {
            System.out.println("play?");
            sound.play();
        }
        if("end".equals(e.getActionCommand()))
        {
            System.out.println("end?");
            sound.end();
        }
    }
}
