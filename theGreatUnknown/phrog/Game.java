import java.io.IOException;
import java.util.ArrayList;

class Game implements Runnable 
{
    Thread thread;
    int time;
    boolean enter;
    ArrayList<String> stack;

    int room = 0;
    int token = 10;

    Game()
    {
        thread = new Thread(this);
        thread.start();

        stack = new ArrayList<>();

        System.out.print("\033[H\033[2J");
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
        String command = Main.in;
        String[] args = command.split(" ");
        command = args[0];

        switch(command)
        {
            case "firewall":
                if(args.length > 1)
                {
                    if(args[1].equals("renew"))
                    {
                        break;
                    }
                    else
                    {
                        break;
                    }
                }
            break;
            case "token":
                stack.add(Integer.toString(token));
            break;
            case "source":
                if(args.length <= 1)
                {
                    switch(room)
                    {
                        case 0:
                            stack.add("disk/home");
                        break;
                        case 1:
                            stack.add("disk/home/programs/phrog/utilities");
                        break;
                        case 2:
                            stack.add("disk/home/main/temp/active");
                        break;
                    }
                    break;
                }
                switch(args[1])
                {
                    case "disk/home":
                        stack.add("active directory switched to disk/home");
                        room = 0;
                    break;
                    case "disk/home/programs/phrog/utilities":
                        stack.add("active directory switched to disk/home/programs/phrog/utilities");
                        room = 2;
                    break;
                    case "disk/home/main/temp/active":
                        stack.add("disk/home/main/temp/active");
                        room = 1;
                    break;
                    case "disk", 
                    "disk/home/programs", 
                    "disk/home/main", 
                    "disk/home/programs/phrog", 
                    "disk/home/main/temp":
                        stack.add("you do not have acess to this directory");
                    break;
                    default:
                        stack.add("ERROR: invalid path");
                    break;
                }
            break;
            case "time":
                stack.add(Integer.toString(Math.round(time/60)));
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