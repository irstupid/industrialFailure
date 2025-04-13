class TextBox
{
  String text = "peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo, peepeepoopoo";
  int tick = 0;
  
  TextBox()
  {
    
  }
  
  void setText(String value)
  {
    text = value;
    tick = 0;
  }
  
  void draw()
  {
    if(text != "")
    {
      push();
        fill(#9999bb);
        rect(0, height - 200, width, height);
        fill(#ffffff);
        for(int i = 0; i < tick; i++)
        {
          text(text.charAt(i), 0 + 7 * (i%floor(width/7)),height - 190 + 10 * floor(i/floor(width/7)));
        }
        if(tick < text.length())
        {
          tick++;
        }
      pop();
    }
  }
}
