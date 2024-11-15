Network net;
String feeder = "10.33.93.211";
String name = "bob";

int id;

int players;
String[] playerNames;
float[] playerXs;
float[] playerYs;
int[] playerColors;

void setup()
{
  net = new Network(this);
  net.startClient(feeder);
  net.putString("NEW:" + name);
  
  size(1000, 1000, P2D);
}

void draw()
{
  parse();
  
  background(#000022);
  drawPlayers();
}

void drawPlayers()
{
  for(int i = 0; i < players; i++)
  {
    push();
      fill(playerColors[i]);
      if(playerNames[i].equals(name))
      {
        strokeWeight(5);
        stroke(#00ff00);
      }
      else
      {
        noStroke();
      }
      
      ellipse(playerXs[i], playerYs[i], 50, 50);
    pop();
  }
}

void keyPressed()
{
  net.putString("KEY_DOWN:" + id + ":" + key);
}

void keyReleased()
{
  net.putString("KEY_UP:" + id + ":" + key);
}

void parse()
{
  for(int count = 0; count < 3; count++)
  {
    String value = net.getString();
    if(value != null)
    {
      String[] values = value.split(":");
      if(values[0].equals("ID") && values[1].equals(name))
      {
        id = int(values[2]);
      }
      else if(values[0].equals("MARCO"))
      {
        id = int("POLO:" + id);
      }
      else
      {
        players = int(values[0]);
        playerNames = new String[players];
        playerXs = new float[players];
        playerYs = new float[players];
        playerColors = new int[players];
        for(int i = 0; i < players; i += 1)
        {
          playerNames[i] = values[(i * 4) + 1];
          playerXs[i] = float(values[(i * 4) + 2]);
          playerYs[i] = float(values[(i * 4) + 3]);
          playerColors[i] = int(values[(i * 4) + 4]);
        }
      }
    }
  }
}
