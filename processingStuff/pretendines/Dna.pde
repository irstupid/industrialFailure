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
      rect(width/2 - (20 * (dna.size() - i)), height/2 + 50, 10, 100);
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
