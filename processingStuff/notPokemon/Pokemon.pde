class Pokemon
{
  
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
}
