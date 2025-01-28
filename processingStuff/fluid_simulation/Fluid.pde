  class Fluid
{
  int sizeX;
  int sizeY;
  int[][] c;
  float[][] velocityX;
  float[][] velocityY;
  
  float overrlaxation = 1.9;
  
  Fluid(int sizeX, int sizeY)
  {
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    
    c = new int[sizeX][sizeY];
    velocityX = new float[sizeX][sizeY + 1];
    velocityY = new float[sizeX + 1][sizeY];
  }
  
  void addInk(float x, float y, int c)
  {
    x = round(x/(width/sizeX));
    y = round(y/(height/sizeY));
    this.c[(int)x][(int)y] += c;
  }
  
  void update()
  {
    for(int n = 0; n < 5; n++)
    {
      for(int x = 0; x < sizeX; x++)
      {
        for(int y = 0; y < sizeY; y++)
        {
          project(x, y);
        }
      }
    }
  }
  
  void modify(int x, int y)
  {
    // nothing yet
  }
  
  void project(int x, int y)
  {
    float d = overrlaxation * (velocityX[x][y] + velocityY[x][y] - velocityX[x + 1][y] - velocityY[x][y + 1]);
    velocityX[x][y] += d/4;
    velocityY[x][y] += d/4;
    velocityX[x + 1][y] -= d/4;
    velocityY[x][y + 1] -= d/4;
  }
  
  void advect(int x, int y)
  {
    // nothing yet
  }
  
  void draw()
  {
    float gridX = width/sizeX;
    float gridY = height/sizeY;
    for(int x = 0; x < sizeX; x++)
    {
      for(int y = 0; y < sizeY; y++)
      {
        fill(c[x][y]);
        rect(x * gridX, y * gridY, gridX, gridY);
      }
    }
  }
}
