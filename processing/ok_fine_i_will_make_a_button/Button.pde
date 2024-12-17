class Button
{
  float x;
  float y;
  int c;
  
  int timesClicked;
  
  int clickTimer;
  boolean clickRequest;
  
  Button(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  void draw()
  { 
    if(state == 3)
    {
      if(clickTimer <= 0 && !clickRequest)
      {
        
      }
    }
    
    if(c == -1) { fill(#000000); }
    if(c == 0) { fill(#ff0000); }
    if(c == 1) { fill(#ffff00); }
    if(c == 2) { fill(#00ff00); }
    if(c == 3) { fill(#0000ff); }
    noStroke();
    ellipse(x, y, 300, 300);
    if(clickReset <= 0)
    {
      timesClicked = 0;
    }
  }
  
  void click()
  {
    if(dist(x, y, mouseX, mouseY) < 300/2)
    {
      timesClicked++;
      c++;
      if(c > 3)
      {
        c = 0;
      }
    }
  }
}
