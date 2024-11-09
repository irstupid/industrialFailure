Network net;
String feeder = "10.33.93.211";
String name = "peepeepoopoo";

String[] playerNames;
float[] playerXs;
float[] playerYs;

void setup()
{
  net = new Network(this);
  net.startClient(feeder);
  net.putString("NEW:" + name);
}

void draw()
{
  parse();
}

void parse()
{
  String value = net.getString();
  if(value != null)
  {
    String[] values = value.split(":");
    int players = int(values[0]);
    playerNames = new String[players];
    playerXs = new float[players];
    playerYs = new float[players];
    for(int i = 0; i < players; i += 3)
    {
      playerNames[i] = values[(i * 3) + 1];
      playerXs[i] = float(values[(i * 3) + 2]);
      playerYs[i] = float(values[(i * 3) + 3]);
    }
  }
}
