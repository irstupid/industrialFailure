Player player;

void setup()
{
    fullscreen(P2D);

    player = new Player(width/2, height/2);
}

void draw()
{
    player.update();

    player.paint();
}

void keyPressed()
{
    player.keyPressed();
}

void keyReleased()
{
    player.keyReleased();
}