class TextBox
{
  
  String text = "peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo";
  int tick = 0;
  
  TextBox()
  {
    
  }
  
  void setText(String value)
  {
    if(value != null && !value.equals(text))
    {
      text = value;
      //println(value);
      tick = 0;
    }
  }
  
  void setText()
  {
    text = "";
    tick = 0;
  }
  
  void draw()
  {
    if(text != "")
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
        }
      pop();
    }
  }
  
  void keyPressed()
  {
    if(key == '1' && tick >= text.length())
    {
      setText();
    }
  }
  
  String getText()
  {
    return text;
  }
}
