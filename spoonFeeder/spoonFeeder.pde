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
  parse();
  serialize();
}

void serialize()
{
  String data = "";
  data += players.size() + ":";
  for(int i = 0; i < players.size(); i++)
  {
    data += players.get(i).name + ":";
    data += players.get(i).x + ":";
    data += players.get(i).y + ":";
  }
  net.broadcast(data);
}

void parse()
{
  String value = net.getNext();
  if(value != null)
  {
    String[] values = value.split(":");
    switch(values[0])
    {
      case("NEW"):
      players.add(new Player(values[1]));
      break;
    }
  }
}
