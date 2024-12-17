Network net;

ArrayList<Player> players;
boolean[] deathNote = new boolean[0];
int dDay = -1;

void setup()
{
  players = new ArrayList<Player>();
  net = new Network(this);
  net.startServer();
  
  size(1, 1, P2D);
}

void draw()
{
  update();
  parse();
  serialize();
}

void update()
{
  for(int i = 0; i < players.size(); i++)
  {
    players.get(i).draw();
  }
  
  
  if(dDay == 0)
  {
    for(int i = 0; i < deathNote.length; i++)
    {
      if(!deathNote[i])
      {
        players.remove(i);
      }
    }
    dDay--;
  }
  else if(dDay > 0)
  {
    dDay--;
  }
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
    data += players.get(i).c + ":";
  }
  net.broadcast(data);
}

void parse()
{
  String value;
  while((value = net.getNext()) != null)
  {
    String[] values = value.split(":");
    switch(values[0])
    {
      case("NEW"):
      players.add(new Player(values[1]));
      net.broadcast("ID:" + values[1] + ":" + (players.size() - 1));
      break;
      case("KEY_DOWN"):
      players.get(int(values[1])).keyPressed(values[2].charAt(0));
      break;
      case("KEY_UP"):
      players.get(int(values[1])).keyReleased(values[2].charAt(0));
      break;
      case("POLO"):
      deathNote[int(values[1])] = true;
      break;
    }
  }
}

void disconnectEvent(Client client) {
  print("bye, bye!");
  deathNote = new boolean[players.size()];
  net.broadcast("MARCO");
}
