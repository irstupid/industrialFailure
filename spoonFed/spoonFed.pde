Network net;
String feeder = "10.33.93.211";
String name = "peepeepoopoo";

void setup()
{
  net = new Network(this);
  net.startClient(feeder);
  net.putString("NEW:" + name);
}

void draw()
{
  
}
