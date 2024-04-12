import processing.sound.*;

SoundFile pew;
SoundFile explosion;
SoundFile zap;
SoundFile laserBounce;
SoundFile boop;
SoundFile hiss;
SoundFile bigBoom;
SoundFile shot;
SoundFile pop;
Sound s = new Sound(this);

Gun gun = null;
ArrayList<Particle> particles = new ArrayList<Particle>();
ArrayList<SnowMan> snowMen = new ArrayList<SnowMan>();

int spawnTime;
int difficulty = 20;
int difficultyUpTime = 30;

float[] circles = new float[10];
float noiseX = random(0, 1000);
float noiseY = random(0, 1000);

int newExplodeTime;
int newSoundTime;

int state = 0;
int t;

int score = 0;
int scoreTime = 30;

JSONObject scores = null;
  
void setup()
{
  //size(800, 800, P2D);
  fullScreen(P2D);
  
  for(int i = 0; i < circles.length; i++)
  {
    circles[i] = (float) i/circles.length;
  }
  
  gun = new Gun(width/2, height/2, 1);
  //snowMen.add(new SnowMan(3, 200, 200));
  
  s.volume(1);
  pew = new SoundFile(this, "pew.wav");
  pew.amp(1);
  explosion = new SoundFile(this, "explosion.wav");
  explosion.amp(0.1);
  zap = new SoundFile(this, "zap.wav");
  zap.amp(0.5);
  laserBounce = new SoundFile(this, "laserBounce.wav");
  laserBounce.amp(0.5);
  boop = new SoundFile(this, "boop.wav");
  boop.amp(0.5);
  hiss = new SoundFile(this, "hiss.wav");
  hiss.rate(2);
  bigBoom = new SoundFile(this, "bigBoom.wav");
  shot = new SoundFile(this, "shot.wav");
  pop = new SoundFile(this, "pop.mp3");
  pop.amp(0.1);
  
  scores = loadJSONObject("scores.json");
  print(width);
}

void draw()
{
  background(0);
  push();
    noStroke();
    for(int i = circles.length - 1; i >= 0; i--)
    {
      circles[i] -= 0.005;
      fill(#ffffff, constrain(((1 - circles[i])) * 200, 0, 50));
      ellipse(width/2, height/2, circles[i] * width * (1 + PI/5), circles[i] * height * (1 + PI/5)); 
      if(circles[i] < 0)
      {
        circles[i] = 1;
      }
    }
    
  noiseX += 0.01 * (mouseX - width/2)/100;
  noiseY += 0.01 * (mouseY - height/2)/100;
  for(int x = 0; x < 100; x++)
  {
    for(float y = 0; y < 100; y++)
    {
      fill(noise(x * 0.03 + noiseX, y * 0.03 + noiseY) * 255, 150);
      rect(x * width/100, y * width/100, width/100, width/100);
    }
  }
  pop();
  
  if(state == 0)
  {
    difficultyUpTime--;
    if(difficultyUpTime <= 0 && difficulty < 75)
  {
    difficultyUpTime = 30;
    difficulty++;
  }
  
  scoreTime--;
  if(scoreTime <= 0)
  {
    scoreTime = 30;
    score++;
  }
    
    spawnTime--;
    if(spawnTime <= 0)
    {
      spawnTime = (int) random(100 - difficulty, 150 - difficulty);
      if(random(0, 2) > 1)
      {
        if(random(0, 2) > 1)
        {
          snowMen.add(new SnowMan((int) random(1, 3.5), 0, random(0, height)));
        }
        else
        {
          snowMen.add(new SnowMan((int) random(1, 3.5), width, random(0, height)));
        }
      }
      else
      {
        if(random(0, 2) > 1)
        {
          snowMen.add(new SnowMan((int) random(1, 3.5), random(0, width), 0));
        }
        else
        {
          snowMen.add(new SnowMan((int) random(1, 3.5), random(0, width), height));
        }
      }
    }
    
    gun.draw();
    for(int i = 0; i < snowMen.size(); i++)
    {
      snowMen.get(i).draw();
    }
    for(int i = 0; i < particles.size(); i++)
    {
      particles.get(i).draw();
    }
       
    textSize(100);
    text(score, width/2, 100);
  }
  else if(state == 1)
  {
    t++;
    if(t >= 120)
    {
      t = 0;
      
      gun.bullets = new ArrayList<Bullet>();
      gun.lasers = new ArrayList<Laser>();
      gun.missiles = new ArrayList<Missile>();
      gun.fastBullets = new ArrayList<FastBullet>();
      
      pew.stop();
      explosion.stop();
      zap.stop();
      laserBounce.stop();
      boop.stop();
      hiss.stop();
      bigBoom.stop();
      shot.stop();
      pop.stop();
      
      newExplodeTime = 0;
      newSoundTime = 0;
      
      state = 2;
    }
    
    newExplodeTime--;
    if(newExplodeTime <= 0)
    {
      newExplodeTime = (int) random(4, 10);
      particles.add(new Particle(width/2 + random(-50, 50), height/2 + random(-50, 50), 1 + 3 * ((int) random(1, 0))));
    }
    newSoundTime--;
    if(newSoundTime <= 0)
    {
      newSoundTime = (int) random(5, 15);
      if(random(0, 1) <= 0.5)
      {
        explosion.play();
      }
      else
      {
        bigBoom.play();
      }
    }
    
    for(int i = 0; i < snowMen.size(); i++)
    {
      snowMen.get(i).draw();
    }
    for(int i = 0; i < particles.size(); i++)
    {
      particles.get(i).draw();
    }
  }
}
void mousePressed()
{
  if(state == 0)
  {
    gun.shoot();
  }
}

void keyPressed()
{
  if(state == 0)
  {
    if(key == ' ')
    {
      gun.type++;
      if(gun.type > 3)
      {
        gun.type = 0;
      }
    }
    if(key == '1')
    {
      gun.type = 0;
    }
    if(key == '2')
    {
      gun.type = 1;
    }
    if(key == '3')
    {
      gun.type = 2;
    }
    if(key == '4')
    {
      gun.type = 3;
    }
  }
}

void saveScore(String name)
{
  scores.setInt(name, score);
  saveJSONObject(scores, "data/scores.json");
}
