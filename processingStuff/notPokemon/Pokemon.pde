class Pokemon
{
  String name;
  int hp;
  int speed;
  
  Moves[] moves = new Moves[6];
  
  Pokemon()
  {
    name = "ball ripper";
    moves[0] = Moves.BONK;
    moves[1] = null;
    moves[2] = null;
    moves[3] = null;
    moves[4] = null;
    moves[5] = null;
  }
  
  void drawFront()
  {
    push();
      translate(-50, -100);
      fill(#00ff00);
      rect(0, 0, 100, 100);
    pop();
  }
  
  void drawBack()
  {
    push();
      push();
      translate(-100, -200);
      fill(#ff0000);
      rect(0, 0, 200, 200);
    pop();
    pop();
  }
  
  void apply(Moves move)
  {
    switch(move)
    {
      case BONK:
        hp -= 30;
        return;
    }
  }
  
  String getName()
  {
    return name;
  }
  
  Moves getMove(int i)
  {
    return moves[i];
  }
  
  void applyToUser(Moves move)
  {
    switch(move)
    {
      
    }
  }
}
