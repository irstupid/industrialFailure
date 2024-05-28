bool light = false;
int horiTime = 0;
int vertTime = 0;

void setup()
{
  Serial.begin(9600);
  pinMode(2, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(4, INPUT);
  pinMode(5, INPUT);
  pinMode(6, INPUT);
  pinMode(7, INPUT);
}

void loop()
{
  if(digitalRead(4))
  {
    vertTime++;
  }
  else
  {
    vertTime -= 5;
    if(vertTime < 0)
    {
      vertTime = 0;
    }
  }
  
  if(digitalRead(5))
  {
    horiTime++;
  }
  else
  {
    horiTime -= 5;
    if(horiTime < 0)
    {
      horiTime = 0;
    }
  }

  Serial.println(horiTime);
  //Serial.println(vertTime);
  
  if(vertTime < horiTime)
  {
    light = true;
  }
  if(horiTime < vertTime)
  {
    light = false;
  }
  
  if (light) {
    digitalWrite(2, HIGH);
    digitalWrite(3, LOW);
  } else {
    digitalWrite(2, LOW);
    digitalWrite(3, HIGH);
  }
}
