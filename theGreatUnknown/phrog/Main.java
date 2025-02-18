class Main
{
    static Game game;
    static Listener listener;

    public static String in = "";
    public static boolean enter;
    public static void main(String[] args) 
    {
        listener = new Listener();
        game = new Game();
    }
}