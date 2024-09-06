float scale;

OrePatch[] ore;
ArrayList<Belt> belts;
PVector select;
PImage beltSheet;
int beltType = 1;

void setup()
{
  size(80 * 18, 80 * 13);
  scale = 80;
  
  beltSheet = loadImage("convayer.png");
  
  ore = new OrePatch[3];
  ore[0] = new OrePatch(0);
  ore[1] = new OrePatch(1);
  ore[2] = new OrePatch(2);
  ore[0].additive();
  ore[1].additive();
  ore[2].additive();
  
  belts = new ArrayList<Belt>();
  select = new PVector();
}

void draw()
{
  select.x = floor(mouseX/scale);
  select.y = floor(mouseY/scale);
  
  background(150);
  for(int i = 0; i <= 18; i++)
  {
    line(i * scale, 0, i * scale, 13 * scale);
  }
  for(int i = 0; i <= 13; i++)
  {
    line(0, i * scale, 18 * scale, i * scale);
  }
  ore[0].draw();
  ore[1].draw();
  ore[2].draw();
  for(int i = 0; i < belts.size(); i++)
  {
    belts.get(i).draw();
  }
  beltIndicator(select.x ,select.y);
}

void keyPressed()
{
  if(key == 'r')
  {
    beltType++;
    if(beltType > 12)
    {
      beltType = 1;
    }
  }
}

void mousePressed()
{
  if(mouseButton == LEFT)
  {
    for(int i = 0; i < belts.size(); i++)
    {
      if(belts.get(i).x == select.x && belts.get(i).y == select.y)
      {
        belts.remove(i);
      }
    }
    belts.add(new Belt((int) select.x, (int) select.y, beltType));
  }
  if(mouseButton == RIGHT)
  {
    for(int i = 0; i < belts.size(); i++)
    {
      if(belts.get(i).x == select.x && belts.get(i).y == select.y)
      {
        belts.remove(i);
      }
    }
  }
}
void mouseDragged()
{
  if(mouseButton == LEFT)
  {
    for(int i = 0; i < belts.size(); i++)
    {
      if(belts.get(i).x == select.x && belts.get(i).y == select.y)
      {
        belts.remove(i);
      }
    }
    belts.add(new Belt((int) select.x, (int) select.y, beltType));
  }
  if(mouseButton == RIGHT)
  {
    for(int i = 0; i < belts.size(); i++)
    {
      if(belts.get(i).x == select.x && belts.get(i).y == select.y)
      {
        belts.remove(i);
      }
    }
  }
}

void beltIndicator(float x, float y)
{
  push();
    tint(#ffffff, 100);
    switch(beltType)
    {
      case 1:
        image(beltSheet, x * scale, y * scale, scale, scale, 80 * 0, 0, 80 * 1, 80);
        break;
      case 2:
        image(beltSheet, x * scale, y * scale, scale, scale, 80 * 1, 0, 80 * 2, 80);
        break;
      case 3:
        image(beltSheet, x * scale, y * scale, scale, scale, 80 * 2, 0, 80 * 3, 80);
        break;
      case 4:
        image(beltSheet, x * scale, y * scale, scale, scale, 80 * 3, 0, 80 * 4, 80);
        break;
      case 5:
        image(beltSheet, x * scale, y * scale, scale, scale, 80 * 4, 0, 80 * 5, 80);
        break;
      case 6:
        image(beltSheet, x * scale, y * scale, scale, scale, 80 * 5, 0, 80 * 6, 80);
        break;
      case 7:
        image(beltSheet, x * scale, y * scale, scale, scale, 80 * 6, 0, 80 * 7, 80);
        break;
      case 8:
        image(beltSheet, x * scale, y * scale, scale, scale, 80 * 7, 0, 80 * 8, 80);
        break;
      case 9:
        image(beltSheet, x * scale, y * scale, scale, scale, 80 * 8, 0, 80 * 9, 80);
        break;
      case 10:
        image(beltSheet, x * scale, y * scale, scale, scale, 80 * 9, 0, 80 * 10, 80);
        break;
      case 11:
        image(beltSheet, x * scale, y * scale, scale, scale, 80 * 10, 0, 80 * 11, 80);
        break;
      case 12:
        image(beltSheet, x * scale, y * scale, scale, scale, 80 * 11, 0, 80 * 12, 80);
        break;
    }
  pop();
}
