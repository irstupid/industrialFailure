import java.io.IOException;
import java.util.ArrayList;

class Game implements Runnable 
{
    public static String[] roomNames = {"home", "temp", "programs", "active", "utilities", "phrog", "downloads", "imports", "pcloud"};

    Thread thread;
    int time;
    boolean enter;
    ArrayList<String> stack;
    ArrayList<String> mail;

    Enemy enemy;

    int state;
    int room;

    int firewall;

    Game()
    {
        thread = new Thread(this);
        thread.start();

        start();
    }

    void start()
    {
        stack = new ArrayList<String>();
        mail = new ArrayList<String>();

        mail.add("test");

        enemy = new Enemy();

        time = 0;
        state = 1;
        room = 0;
        firewall = 60 * 60;

        System.out.print("\033[H\033[2J");
        System.out.print("> ");
    }

    void update() throws IOException
    {
        enemy.update();

        enter = Main.enter;
        time++;

        if(firewall > 0)
        {
            firewall--;
        }
        if(firewall <= 0 && state != 0)
        {
            stack.add("\033[2K\r");
            stack.add("Die\n");
            stack.add("\"start\" to play again\n");
            stack.add("\n> ");
            state = 0;
        }

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

        if(command.equals(""))
        { 
            stack.add("\n> ");
            return; 
        }

        if(state == 1)
        {
            switch(command)
            {
                case "mail":
                    stack.add("you have ");
                    stack.add(Integer.toString(mail.size()));
                    stack.add(" peices of mail");
                    if(mail.size() > 0)
                    {
                        stack.add(":");
                    }
                    for(int i = 0; i < mail.size(); i++)
                    {
                        stack.add(mail.get(i));
                    }
                    mail.clear();
                break;
                case "die":
                    firewall = 0;
                break;
                case "firewall":
                    if(room != 0)
                    {
                        stack.add("ERROR: program not found. are you disk/home?");
                        break;
                    }
                    if(args.length > 1)
                    {
                        if(args[1].equals("renew"))
                        {
                            stack.add("firewall renewed");
                            firewall = 60 * 60;
                            break;
                        }
                        else
                        {
                            stack.add("ERROR: invalid arugument");
                            break;
                        }
                    }
                    stack.add(Integer.toString(Math.round(firewall/60)));
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
                                stack.add("disk/home/programs/utilities");
                            break;
                            case 2:
                                stack.add("disk/home/temp/active");
                            break;
                        }
                        break;
                    }
                    switch(args[1])
                    {
                        case "disk/home":
                            stack.add("active directory switched to ");
                            stack.add("disk/home");
                            room = 0;
                        break;
                        case "disk/home/programs/utilities":
                            stack.add("active directory switched to ");
                            stack.add("disk/home/programs/utilities");
                            room = 1;
                        break;
                        case "disk/home/temp/active":
                            stack.add("active directory switched to ");
                            stack.add("disk/home/temp/active");
                            room = 2;
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
        }

        if(state == 0 && command.equals("start"))
        {
            Main.enter = false;
            start();
            return;
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