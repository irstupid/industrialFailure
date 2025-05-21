class Battle
{
  Pokemon[] player = new Pokemon[4];
  Pokemon[] opponent = new Pokemon[4];
  
  int state;
  
  int menu;
  int select;
  
  Battle(Trainer trainer, Pokemon[] pokemon)
  {
    player = pokemon;
  }
  
  Battle()
  {
    player[0] = new Pokemon();
    opponent[0] = new Pokemon();
  }
  
  void draw()
  {
    push();
      push();
        background(#dddddd);
        fill(#bbbbcc);
        ellipse(width/4 * 3, height/4, width/2.5, height/6);
        ellipse(width/4, height/4 * 2.75, width/1.5, height/4);
      pop();
      push();
        translate(width/4 * 3, height/4);
        opponent[0].drawFront();
      pop();
      push();
        translate(width/4, height/4 * 2.75);
        player[0].drawBack();
      pop();
      switch(menu)
      {
        case 0:
        
        break;
        case 1:
        
        break;
        case 2:
        
        break;
        case 3:
        
        break;
      }
    pop();
  }
  
  void keyPressed()
  {
    
  }
  
  void keyReleased()
  {
    
  }
}
