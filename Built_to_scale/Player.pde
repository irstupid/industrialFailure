class Player
{
  float x;
  float y;
  float xV;
  float yV;
  int state = 1;
  int cycle;
  float speed = 2;
  int coolDown;
  int iv;
  int flash;
  int health = 3;
  float kbx;
  float kby;
  float direction;
  int strong;
  
  PImage idle;
  PImage walk1;
  PImage walk2;
  PImage roll;
  
  float SPEED = 2;
  
  Player(float x, float y)
  {
    this.x = x;
    this.y = y;
    
    idle = loadImage("idle.png");
    walk1 = loadImage("walk1.png");
    walk2 = loadImage("walk2.png");
    roll = loadImage("roll.png");
    idle.resize(400, 400);
    walk1.resize(400, 400);
    walk2.resize(400, 400);
    roll.resize(400, 400);
  }
  
  void draw()
  {
    strong--;
    x += xV * speed + kbx;
    y += yV * speed + kby;
    x = constrain(x, 25, width - 25);
    y = constrain(y, 25, height - 25);
    kbx = kbx/1.3;
    kby = kby/1.3;
    coolDown--;
    iv--;
    flash++;
    if(flash > 20)
    {
      flash = 0;
    }
    if(state != 2)
    {
      if(xV != 0 || yV != 0)
      {
        direction = atan2(yV, xV);
        state = 1;
      }
      else
      {
        state = 0;
      }
      cycle++;
      if(cycle > 30)
      {
        cycle = 0;
      }
      speed = SPEED;
      
      collisonDetection();
    }
    else
    {
      cycle--;
      speed = SPEED * 3;
      if(cycle <= 0)
      {
        state = 0;
      }
    }
    speed = speed * (strong > 0 ? 3 : 1);
    push();
    if(flash < 10 && iv > 0)
    {
      tint(#ff0000);
    }
    else if(strong > 0)
    {
      tint(#ff8800);
    }
    if(state == 0)
    {
      image(idle, x - idle.width/2, y - idle.height/2 + 17);
    }
    else if(state == 1)
    {
      if(cycle < 10)
      {
        image(walk1, x - walk1.width/2, y - walk1.height/2 + 17);
      }
      else if(cycle < 15)
      {
        image(idle, x - idle.width/2, y - idle.height/2 + 17);
      }
      else if(cycle < 25)
      {
        image(walk2, x - walk2.width/2, y - walk2.height/2 + 17);
      }
      else
      {
        image(idle, x - idle.width/2, y - idle.height/2 + 17);
      }
    }
    else if(state == 2) 
    {
      push();
        translate(x, y);
        rotate(-cycle/3f);
        translate(-200, -176);
        image(roll, 0, 0);
      pop();
    }
    pop();
    
    fill(#ffffff, 100);
    //ellipse(x, y, 50, 50);
    
    if(health <= 0)
    {
      println("die");
    }
  }
  
  void keyPressed()
  {
    switch(key)
    {
      case 'w':
        yV += -1;
        break;
      case 'a':
        xV += -1;
        break;
      case 's':
        yV += 1;
        break;
      case 'd':
        xV += 1;
        break;
      case ' ':
        if(coolDown <= 0)
        {
          state = 2;
          cycle = 30;
          coolDown = 90;
        }
        break;
      case 'i':
        if(state != 2)
        {
          carrots.add(new Carrot(x, y, direction));
        }
        break;
    }
  }
  
  void keyReleased()
  {
    switch(key)
    {
      case 'w':
        yV += 1;
        break;
      case 'a':
        xV += 1;
        break;
      case 's':
        yV += -1;
        break;
      case 'd':
        xV += -1;
        break;
    }
  }
  
  void collisonDetection()
  {
    for(int i = 0; i < enemys.size(); i++)
    {
      if(enemys.get(i).distance(x, y) < 25)
      {
        if(iv < 0)
        {
          health--;
          iv = 60;
        }
        PVector pushPoint = enemys.get(i).closePoint(x, y);
        pushPoint = new PVector(x, y).sub(pushPoint);
        pushPoint.normalize();
        kbx = pushPoint.x * 30;
        kby = pushPoint.y * 30;
      }
    }
    if(iv < 0)
    {
      for(int i = 0; i < explosions.size(); i++)
      {
        if(dist(explosions.get(i).x, explosions.get(i).y, x, y) < 125)
        {
          health--;
          iv = 60;
        }
      }
    }
    for(int i = 0; i < carrots.size(); i++)
    {
      if(dist(carrots.get(i).x, carrots.get(i).y, x, y) < 40 && carrots.get(i).unHit < 0)
      {
        carrots.get(i).die();
        strong = 120;
      }
    }
  }
}
