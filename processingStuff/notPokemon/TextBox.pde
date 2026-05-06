class TextBox
{
  
  String text = "peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo";
  int tick = 0;
  
  boolean done = false;
  
  TextBox(String text)
  {
    this.text = text;
  }
  
  void draw()
  {
    push();
      fill(#9999bb);
      rect(0, height - 200, width, 200);
      fill(#ffffff);
      textSize(15);
      for(int i = 0; i < tick; i++)
      {
        text(text.charAt(i), 2 + 7 * (i%floor(width/7)), height - 185 + 15 * floor(i/floor(width/7)));
      }
      if(tick < text.length())
      {
        tick++;
      } else {
         done = true; 
      }
    pop();
  }
  
  void skip() {
     tick = text.length();
  }
  
  String getText()
  {
    return text;
  }
}
