import java.io.IOException;
import java.util.ArrayList;

class Game implements Runnable 
{
    Thread thread;
    int time;
    boolean enter;

    ArrayList<String> stack;

    Game()
    {
        thread = new Thread(this);
        thread.start();

        stack = new ArrayList<String>();

        System.out.print("> ");
    }

    void update() throws IOException
    {
        enter = Main.enter;
        time++;
        if(enter)
        {
            command();
        }
        draw();
        Main.enter = false;
    }

    void draw()
    {
        if(stack.isEmpty()) { return; }
        System.out.print(stack.get(0));
        stack.remove(0);
    }

    void command()
    {
        switch(Main.in)
        {
            case "time":
                stack.add(String.valueOf(Math.round(time/60)));
            break;
            default:
                stack.add("ERROR: command not know");
            break;
        }
        stack.add("\n> ");
    }

    @Override
    public void run()
    {
        float timePerFrame = 1000000000/60;
        long lastFrame = System.nanoTime();

        while(true)
        {
            long now = System.nanoTime();
            if(now - lastFrame >= timePerFrame)
            {
                try
                {
                    update();
                }
                catch(IOException e)
                {
                    System.exit(0);
                }
                lastFrame = now;
            }
        }
    }
}