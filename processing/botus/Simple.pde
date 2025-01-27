class Simple extends Stage
{
  boolean onGround(float x, float y, float w, float h)
  {
    if(height - (y + h/2) <= 100)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}
