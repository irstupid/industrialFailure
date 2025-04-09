class Main
{
    static Game game;
    static Listener listener;

    public static String in;
    public static boolean enter;

    public static String[] ROOMNAMES = {"home", "temp", "programs", "active", "utilities", "phrog", "downloads", "imports", "pcloud"};
    public static void main(String[] args) 
    {
        start();
    }

    private static void start()
    {
        in = "";
        enter = false;
        listener = new Listener();
        game = new Game();
    }
}