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

int state = 2;
int t;

int score = 0;
int scoreTime = 30;

JSONArray scores = null;
int selectedKey = 1;
String name = new String();
  
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
      
      JSONArray scores = loadJSONArray("data/scores.json");
      int[] sortScores = new int[scores.size()];
      for(int i = 0; i < scores.size(); i++)
      {
        sortScores[i] = scores.getJSONObject(i).getInt("score");
      }
      sortScores = sort(sortScores);
      if(sortScores.length < 10)
      {
        state = 2;
      }
      else if(sortScores[constrain(sortScores.length - 10, 0, scores.size())] < score)
      {
        state = 2;
      }
      else
      {
        state = 3;
      }
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
  else if(state == 2)
  {
    push();
      textSize(50);
      fill((selectedKey == 1 ? #aaaaff : #aaaaaa));
      rect(width/2 - 120, height/2, 100, 100, 20);
      fill(#ffffff);
      text("A", width/2 + 5 - 120, height/2 + 65);
      text("B", width/2 + 35 - 120, height/2 + 65);
      text("C", width/2 + 65 - 120, height/2 + 65);
      fill((selectedKey == 2 ? #aaaaff : #aaaaaa));
      rect(width/2, height/2, 100, 100, 20);
      fill(#ffffff);
      text("D", width/2 + 5, height/2 + 65);
      text("E", width/2 + 35, height/2 + 65);
      text("F", width/2 + 65, height/2 + 65);
      fill((selectedKey == 3 ? #aaaaff : #aaaaaa));
      rect(width/2 + 120, height/2, 100, 100, 20);
      fill(#ffffff);
      text("G", width/2 + 5 + 120, height/2 + 65);
      text("H", width/2 + 37 + 120, height/2 + 65);
      text("I", width/2 + 72 + 120, height/2 + 65);
      fill((selectedKey == 4 ? #aaaaff : #aaaaaa));
      rect(width/2 - 120, height/2 + 120, 100, 100, 20);
      fill(#ffffff);
      text("J", width/2 + 5 - 120, height/2 + 65 + 120);
      text("K", width/2 + 35 - 120, height/2 + 65 + 120);
      text("L", width/2 + 65 - 120, height/2 + 65 + 120);
      fill((selectedKey == 5 ? #aaaaff : #aaaaaa));
      rect(width/2, height/2 + 120, 100, 100, 20);
      fill(#ffffff);
      text("M", width/2 + 3, height/2 + 65 + 120);
      text("N", width/2 + 35, height/2 + 65 + 120);
      text("O", width/2 + 65, height/2 + 65 + 120);
      fill((selectedKey == 6 ? #aaaaff : #aaaaaa));
      rect(width/2 + 120, height/2 + 120, 100, 100, 20);
      fill(#ffffff);
      text("P", width/2 + 5 + 120, height/2 + 65 + 120);
      text("Q", width/2 + 32 + 120, height/2 + 65 + 120);
      text("R", width/2 + 65 + 120, height/2 + 65 + 120);
      fill((selectedKey == 7 ? #aaaaff : #aaaaaa));
      rect(width/2 - 120, height/2 + 240, 100, 100, 20);
      fill(#ffffff);
      text("S", width/2 + 5 - 120, height/2 + 65 + 240);
      text("T", width/2 + 35 - 120, height/2 + 65 + 240);
      text("U", width/2 + 65 - 120, height/2 + 65 + 240);
      fill((selectedKey == 8 ? #aaaaff : #aaaaaa));
      rect(width/2, height/2 + 240, 100, 100, 20);
      fill(#ffffff);
      text("V", width/2 + 3, height/2 + 65 + 240);
      text("W", width/2 + 30, height/2 + 65 + 240);
      text("X", width/2 + 69, height/2 + 65 + 240);
      fill((selectedKey == 9 ? #aaaaff : #aaaaaa));
      rect(width/2 + 120, height/2 + 240, 100, 100, 20);
      fill(#ffffff);
      text("Y", width/2 + 5 + 120, height/2 + 65 + 240);
      text("Z", width/2 + 30 + 120, height/2 + 65 + 240);
      textSize(25);
      text("dlt", width/2 + 60 + 120, height/2 + 65 + 240);
      textSize(100);
      fill(#ffffff);
      text(name, width/2 - ((name.length() - 1) * 25) + 25, height/2 - 50);
      
      textSize(100);
      text("please enter name", width/2 - 333, height/2 - 275);
      text("press start to play again", width/2 - 450, height/2 - 175);
    pop();
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
  if(state == 2)
  {
    if(key == 'w')
    {
      selectedKey -= 3;
    }
    if(key == 's')
    {
      selectedKey += 3;
    }
    if(key == 'a')
    {
      selectedKey -= 1;
    }
    if(key == 'd')
    {
      selectedKey += 1;
    }
    if(selectedKey > 9)
    {
      selectedKey -= 9;
    }
    if(selectedKey < 1)
    {
      selectedKey += 9;
    }
    
    if(key == '1')
    {
      if(selectedKey == 1)
      {
        name += "A";
      }
      else if(selectedKey == 2)
      {
        name += "D";
      }
      else if(selectedKey == 3)
      {
        name += "G";
      }
      else if(selectedKey == 4)
      {
        name += "J";
      }
      else if(selectedKey == 5)
      {
        name += "M";
      }
      else if(selectedKey == 6)
      {
        name += "P";
      }
      else if(selectedKey == 7)
      {
        name += "S";
      }
      else if(selectedKey == 8)
      {
        name += "V";
      }
      else if(selectedKey == 9)
      {
        name += "Y";
      }
    }
    if(key == '2')
    {
      if(selectedKey == 1)
      {
        name += "B";
      }
      else if(selectedKey == 2)
      {
        name += "E";
      }
      else if(selectedKey == 3)
      {
        name += "H";
      }
      else if(selectedKey == 4)
      {
        name += "K";
      }
      else if(selectedKey == 5)
      {
        name += "N";
      }
      else if(selectedKey == 6)
      {
        name += "Q";
      }
      else if(selectedKey == 7)
      {
        name += "T";
      }
      else if(selectedKey == 8)
      {
        name += "W";
      }
      else if(selectedKey == 9)
      {
        name += "Z";
      }
    }
    if(key == '3')
    {
      if(selectedKey == 1)
      {
        name += "C";
      }
      else if(selectedKey == 2)
      {
        name += "F";
      }
      else if(selectedKey == 3)
      {
        name += "I";
      }
      else if(selectedKey == 4)
      {
        name += "L";
      }
      else if(selectedKey == 5)
      {
        name += "O";
      }
      else if(selectedKey == 6)
      {
        name += "R";
      }
      else if(selectedKey == 7)
      {
        name += "U";
      }
      else if(selectedKey == 8)
      {
        name += "X";
      }
      else if(selectedKey == 9 && name.length() > 0)
      {
        name = name.replaceFirst(String.valueOf(name.charAt(name.length() - 1)), "");
      }
    }
    
    if(key == 'z')
    {
      saveScore(name);
      state = 3;
      
    }
  }
}

void saveScore(String name)
{
  scores = loadJSONArray("scores.json");
  JSONObject value = new JSONObject();
  value.setString("name", name);
  value.setInt("score", score);
  scores.setJSONObject(scores.size(), value);
  saveJSONArray(scores, "data/scores.json");
}
