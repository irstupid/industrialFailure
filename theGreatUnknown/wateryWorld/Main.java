

class Main extends Thread
{
    static Game game;
    public static void main(String[] args)
    {
        game = new Game();
        game.start();
    }
}