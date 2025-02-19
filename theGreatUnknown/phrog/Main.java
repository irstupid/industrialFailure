class Main
{
    static Game game;
    static Listener listener;

    public static String in;
    public static boolean enter;
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