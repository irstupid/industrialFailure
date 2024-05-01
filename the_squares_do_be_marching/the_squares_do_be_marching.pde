float res = 50;
float[][] points;
float offsetX;
float offsetY;

void setup()
{
  size(1000, 1000, P2D);
  points = new float[floor(width/res) + 1][floor(height/res) + 1];
  
  for(int i = 0; i < points.length; i++)
  {
    for(int j = 0; j < points[i].length; j++)
    {
      points[i][j] = random(0, 1);
    }
  }
  
  stroke(1);
}

void draw()
{
  background(#000000);
  for(int i = 0; i < points.length; i++)
  {
    for(int j = 0; j < points[i].length; j++)
    {
      points[i][j] = noise((i + offsetX)/2, (j + offsetY)/2);
    }
  }
  
  if(keyPressed)
  {
    if(key == 'w')
    {
      offsetY -= 1;
    }
    if(key == 's')
    {
      offsetY += 1;
    }
    if(key == 'a')
    {
      offsetX -= 1;
    }
    if(key == 'd')
    {
      offsetX += 1;
    }
  }
  
  theSquaresBeMarching(0.5);
}

void theSquaresBeMarching(float threshold)
{
  int[][] squares = new int[points.length - 1][points[0].length - 1];
  for(int i = 0; i < squares.length; i++)
  {
    for(int j = 0; j < squares[i].length; j++)
    {
      squares[i][j] = (int) 
      (1 * (points[i][j] > threshold ? 1 : 0)) +
      (2 * (points[i + 1][j] > threshold ? 1 : 0)) +
      (4 * (points[i + 1][j + 1] > threshold ? 1 : 0)) +
      (8 * (points[i][j + 1] > threshold ? 1 : 0));
      
      //point(i * res + res/2, j * res + res/2);
      stroke(#ff0000);
      switch(squares[i][j]) 
      {
        case 0:
          break;
        case 1:
          line(i * res, j * res + res/4, i * res + res/4, j * res);
          break;
        case 2: 
          line(i * res + (res * 3)/4, j * res, i * res + res, j * res + res/4);
          break;
        case 3: 
          line(i * res, j * res + res/4, i * res + res, j * res + res/4);
          break;
        case 4: 
          line(i * res + (res * 3)/4, j * res + res, i * res + res, j * res + (res * 3)/4);
          break;
        case 5: 
          line(i * res + (res * 3)/4, j * res + res, i * res + res, j * res + (res * 3)/4);
          line(i * res, j * res + res/4, i * res + res/4, j * res);
          break;
        case 6: 
          line(i * res + (res * 3)/4, j * res, i * res + (res * 3)/4, j * res + res);
          break;
        case 7: 
          line(i * res, j * res + res/4, i * res + (res * 3)/4, j * res + res);
          break;
        case 8:  
          line(i * res, j * res + (res * 3)/4, i * res + res/4, j * res + res);
          break;
        case 9: 
          line(i * res + res/4, j * res, i * res + res/4, j * res + res);
          break;
        case 10: 
          line(i * res + (res * 3)/4, j * res, i * res + res, j * res + res/4);
          line(i * res, j * res + (res * 3)/4, i * res + res/4, j * res + res);
          break;
        case 11: 
          line(i * res + res/4, j * res + res, i * res + res, j * res + res/4);
          break;
        case 12: 
          line(i * res, j * res + (res * 3)/4, i * res + res, j * res + (res * 3)/4);
          break;
        case 13: 
          line(i * res + res/4, j * res, i * res + res, j * res + (res * 3)/4);
          break;
        case 14: 
          line(i * res, j * res + (res * 3)/4, i * res + (res * 3)/4, j * res);
          break;
        case 15:
          break;
      }
    }
  }
  
  
}
