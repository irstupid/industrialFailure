Player player;
ArrayList<Projectile> projectiles;

void setup()
{
  fullScreen(P2D);

  player = new Player(width/2, height/2);
  projectiles = new ArrayList<Projectile>();
}

void draw()
{
  player.update();
  player.paint();
  for(int i = 0; i < projectiles.size(); i++)
  {
    projectiles.get(i).update();
    projectiles.get(i).paint();
  }
}

void keyPressed()
{
  player.keyPressed();
}

void keyReleased()
{
  player.keyReleased();
}
