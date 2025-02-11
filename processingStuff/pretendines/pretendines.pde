Dna dna;
void setup()
{
  size(800, 800);
  
  dna = new Dna();
}

void draw()
{
  background(#000022);
  dna.draw();
}

void keyPressed()
{
  if(key == '1')
  {
    dna.add(0);
  }
  if(key == '2')
  {
    dna.add(1);
  }
  if(key == '3')
  {
    dna.add(2);
  }
  if(key == '4')
  {
    dna.add(3);
  }
}
