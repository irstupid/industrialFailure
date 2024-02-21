Player player = null;

Flower testFlower = null;

float noiseX = random(0, 1000);
float noiseY = random(0, 1000);
float noiseYV = 0;
float noiseXV = 0;

ArrayList<Flower> flowers = new ArrayList<Flower>();
int flowerSpawn = (int) random(2, 15);

ArrayList<Cookie> cookies = new ArrayList<Cookie>();
int cookieSpawn = (int) random(2, 15);

void setup()
{
  size(800, 800, P2D);
  player = new Player(100, 100, 5);
  testFlower = new Flower(width/2, height/2, random(25, 110), random(0, 90), color(random(0, 255), random(0, 255), random(0, 255)), color(random(0, 255), random(0, 255), random(0, 255)));
}

void draw()
{
  background(90);
  noiseX += 0.05 * (noiseXV)/200;
  noiseY += 0.05 * (noiseYV)/200;
  noiseXV = random(-1000, +1000);
  noiseYV = random(-1000, +1000);
  for(int x = 0; x < 100; x++)
  {
    for(float y = 0; y < 100; y++)
    {
      noStroke();
      fill(random(0, 255) - noise(x * 0.03 + noiseX, y * 0.03 + noiseY) * 255, random(0, 255) - noise(x * 0.03 + noiseX, y * 0.03 + noiseY) * 255, random(0, 255) - noise(x * 0.03 + noiseX, y * 0.03 + noiseY) * 255, noise(x * 0.03 + noiseX, y * 0.03 + noiseY) * 255);
      rect(x * 8, y * 8, 8, 8);
    }
  }
  
  flowerSpawn--;
  if(flowerSpawn <= 0)
  {
    flowers.add(new Flower(random(0, 800), random(0, 800), random(25, 110), random(0, 90), color(random(0, 255), random(0, 255), random(0, 255)), color(random(0, 255), random(0, 255), random(0, 255))));
    flowerSpawn = (int) random(2, 15);
  }
  for(int i = flowers.size()-1; i >= 0; i--)
  {
    flowers.get(i).draw();
    if(flowers.get(i).done)
    {
      flowers.remove(i);
    }
  }
  
  cookieSpawn--;
  if(cookieSpawn <= 0)
  {
    cookies.add(new Cookie(random(0, height), random(1.5, 6), random(25, 100)));
    cookieSpawn = (int) random(2, 15);
  }
  for(int i = cookies.size()-1; i >= 0; i--)
  {
    cookies.get(i).draw();
    if(cookies.get(i).done)
    {
      cookies.remove(i);
    }
  }
  
  //testFlower.draw();
  
  player.draw();
}

void keyPressed()
{
  player.keyPressed();
}

void keyReleased()
{
  player.keyReleased();
}
