import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

class Listener implements Runnable 
{
    Thread thread;
    BufferedReader reader;

    public Listener() 
    {
        reader = new BufferedReader(new InputStreamReader(System.in));
        thread = new Thread(this);
        thread.start();
    }
    
    @Override
    public void run()
    {
        while(true)
        {
            try
            {
                Main.in = reader.readLine();
            }
            catch(IOException e)
            {
                System.exit(0);
            }
        }
    }
}