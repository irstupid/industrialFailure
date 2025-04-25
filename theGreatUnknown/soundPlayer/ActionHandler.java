
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class ActionHandler implements ActionListener
{
    @Override
    public void actionPerformed(ActionEvent e) 
    {
        if("play".equals(e.getActionCommand()))
        {
            System.out.println("play");
        }
    }
}
