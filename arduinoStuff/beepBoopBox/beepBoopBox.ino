int[][] charles = {
  {0, 0, 0, 0},
  {0, 0, 0, 0},
  {0, 0, 0, 0},
  {0, 0, 0, 0},
  {0, 0, 0, 0},
  {0, 0, 0, 0},
  {0, 0, 0, 0},
  {0, 0, 0, 0},
  {0, 0, 0, 0},
  {0, 0, 0, 0},
  {0, 0, 0, 0},
  {0, 0, 0, 0}
};

int doom;
int task;

void setup()
{
  Serial.begin(9600);
  pinMode(13, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(10, OUTPUT);
  pinMode(7, INPUT);
  pinMode(6, INPUT);
  pinMode(5, INPUT);
  pinMode(4, INPUT);
  pinMode(3, INPUT);

  doom = 30;
}

void loop()
{
  if(doom > 0)
  {
    doom--;
    
  }
  else
  {
    draw(11)
  }
}

int knob()
{
  return 0;
}

void randomize()
{
  doom = 30;
  int random = random(1, 3)
  if(random == 1)
  {
    random = random(1, 3)
    task = 5 + random;
  }
  else if(random == 2)
  {
    random = random(1, 2)
    task = 10 - random;
  }
  else
  {
    random = random(0, 5)
    task = random;
  }
}

void draw(int value)
{
  for(int i = 0; i < 4; i++)
  {
    if(charles[value][i] == 0)
    {
      pinmode(10 + i, INPUT)
    }
    else
    {
      pinmode(10 + i, OUTPUT)
      digitalWrite(10 + i, charles[value][i]);
    }
  }
}
