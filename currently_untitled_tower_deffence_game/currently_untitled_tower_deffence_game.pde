float[][] path = {{0, 100}, {600, 100}, {600, 700}, {100, 700}, {100, 800}};

Enemy0[] enemys = new Enemy0[1];
int enemysAlive = enemys.length;

int round = -1;
boolean roundDone = true;
int roundT;

int[][] enemySequence = {{0}, {0, 15}};

void setup()
{
  size(800, 800);
}

void draw()
{
  background(#777788);
  push();
    stroke(#FFD9A0);
    strokeWeight(50);
    for(int i = 1; i < path.length; i++)
    {
      line(path[i - 1][0], path[i - 1][1], path[i][0], path[i][1]);
    }
  pop();
  
  for(int i = 0; i < enemys.length; i++)
  {
    if(enemys[i] != null)
    {
      enemys[i].draw();
    }
  }
  
  if(enemysAlive < enemys.length && !roundDone)
  {
    print("die");
    roundDone = true;
  }
  
  if(round != -1 && !roundDone)
  {
    for(int i = 0; i < enemys.length; i++)
    {
      if(roundT == enemySequence[round][i])
      {
        enemys[i] = new Enemy0(new PVector(path[0][0], path[0][1]), i);
      }
    }
  }
  
  if(!roundDone)
  {
    roundT++;
  }
}

void keyPressed()
{
  if(key == '1' && roundDone)
  {
    round++;
    roundDone = false;
    enemysAlive = enemySequence[round].length;
    enemys = new Enemy0[enemySequence[round].length];
    roundT = 0;
  }
}

void enemyWin(int enemy)
{
  enemys[enemy] = null;
  enemysAlive -= 1;
}
