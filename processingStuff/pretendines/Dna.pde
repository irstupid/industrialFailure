class Dna
{
  IntList dna;
  Dna()
  {
    dna = new IntList(); 
  }
  
  void draw()
  {
    push();
    rectMode(CENTER);
    for(int i = dna.size(); i > 0; i--)
    {
      switch(dna.get(i - 1))
      {
        case 0:
          fill(#ff0000);
        break;
        case 1:
          fill(#ffff00);
        break;
        case 2:
          fill(#00ff00);
        break;
        case 3:
          fill(#0000ff);
        break;
      }
      rect(width/2 - (20 * (dna.size() - i)), height/2, 10, sin((i * PI)/4) * 50 + 20);
    }
    pop();
  }
  
  void add(int value)
  {
    dna.append(value);
  }
  
  void remove(int value)
  {
    dna.remove(value);
  }
}
