class UI
{
  UI()
  {
    
  }
  
  void draw()
  {
    noFill();
    stroke(#0004a6);
    strokeWeight(weight);
    push();
      translate(width - 100, 0);
      rect(weight/2, weight/2, 100 - weight, height - weight);
    pop();
  }
}
