class ScaleFrame
{
  int w;
  int h;
  
  boolean horizontal;
  
  float scaleFactor;
  float padding;
  
  int boarderColor = #000000;
  ScaleFrame(int w, int h)
  {
    this.w = w;
    this.h = h;
    if(width - w < height - h)
    {
      horizontal = false;
    }
    else
    {
      horizontal = true;
    }
    
    if(horizontal)
    {
      scaleFactor = (float)height/(float)h;
      padding = (width - (w * scaleFactor))/2;
    }
    else
    {
      scaleFactor = (float)width/(float)w;
      padding = (height - (h * scaleFactor))/2;
    }
  }
  
  public void setBoarderColor(int boarderColor)
  {
    this.boarderColor = boarderColor;
  }
  
  public void transform()
  {
    push();
      translate(padding * (horizontal ? 1 : 0), padding  * (!horizontal ? 1 : 0));
      scale(scaleFactor);
    //cursed sytax
  }
  
  public void border()
  {
    pop();
    push();
      fill(boarderColor);
      noStroke();
      rectMode(CORNER);
      if(horizontal)
      {
        rect(0, 0, padding, height);
        translate(padding + w * scaleFactor, 0);
        rect(0, 0, padding, height);
      }
      else
      {
        rect(0, 0, width, padding);
        translate(0, padding + h * scaleFactor);
        rect(0, 0, width, padding);
      }
    pop();
  }
}
