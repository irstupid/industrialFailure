char[][] list = {
  {'d', 'f', 'm', 'a', 'n'},
  {'c', 'o', 'p', 'w', 'e'},
  {'l', 'o', 'g', 'a', 'w'},
  {'q', 'd', 'u', 'm', 'p'},
  {'c', 'a', 't', 'd', 'l'}
};
String word = "dog";

int step;
int i;
int j;

int[][] overflow;
ArrayList<int[][]> found;


void setup()
{
  textFont(createFont("mono.ttf", 50));
  size(5 * 50, 5 * 50);
}

void draw()
{
  if(step == 1)
  {
    if(list[i][j] == word.charAt(0))
    {
      int[][] temp = new int[1][2];
      temp[0][0] = i;
      temp[0][1] = j;
      found.add(temp);
    }
    i++;
    if(i > list.length)
    {
      i = 0;
      j++;
      if(j > list[i].length)
      {
        step = 2;
      }
    }
  }
  
  //draw
  for(int y = 0; y < list.length; y++)
  {
    for(int x = 0; x < list[y].length; x++)
    {
      
      text(list[y][x], 50 * x, 50 * y + 50);
    }
  }
}
