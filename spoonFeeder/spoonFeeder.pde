Network net;

ArrayList<Player> players;

void setup()
{
  players = new ArrayList<Player>();
  net = new Network(this);
  net.startServer();
}

void draw()
{
  String in = net.getNext();
  if(in != null)
  {
    //parse data n stuff
  }
}
