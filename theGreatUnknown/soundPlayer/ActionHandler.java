
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class ActionHandler implements ActionListener
{
    boolean[] requests;
    ActionHandler(boolean[] requests)
    {
        this.requests = requests;
    }

    @Override
    public void actionPerformed(ActionEvent e) 
    {
        if("play".equals(e.getActionCommand()))
        {
            System.out.println("play?");
            requests[0] = true;
        }
    }
}
