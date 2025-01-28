class Test extends Fighter
{
  Test()
  {
    
  }
  
  public void draw()
  {
    push();
      rectMode(CENTER);
      rect(x, y, WIDTH, HEIGHT);
    pop();
  }
}
