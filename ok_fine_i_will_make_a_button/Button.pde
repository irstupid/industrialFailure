class Button
{
  float x;
  float y;
  int state;
  
  Button(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  void draw()
  { 
    if(state == 0) { fill(#ff0000); }
    if(state == 1) { fill(#ffff00); }
    if(state == 2) { fill(#00ff00); }
    if(state == 3) { fill(#0000ff); }
    noStroke();
    ellipse(x, y, 300, 300);
  }
  
  void click()
  {
    if(dist(x, y, mouseX, mouseY) < 300/2)
    {
      state++;
      if(state > 3)
      {
        state = 0;
      }
    }
  }
}
