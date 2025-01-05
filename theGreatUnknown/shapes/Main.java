
class Main
{
    static Game game;
    public static void main(String[] args)
    {
        game = new Game();

        while(true)
        {
            game.update();
        }
    }
}