class Player {
  final float MAX_SPEED = 5;
  final float ACCELERATION = 1;
  final float DECELERATION = 1;
  final float FORCE_DECAY = 2;
  final float FORCE_CONTROLL = 0.2;
  final float EXPLOSION_MAGNITUDE = 0.6;
  final int ANIMATION_SPEED = 10;
  final int FLOWER_ANIMATION_SPEED = 20;
  final int INVINCIBLE_FRAMES = 180;
  final int INVINCIBLE_FlASH = 10;
  final int COOLDOWN = 5;
  
  PImage[] sprite = new PImage[4];
  int a;
  
  PImage[] bright = new PImage[4];
  float[][] trail = new float[5][2];
  int trailTimer;
  
  PImage[] flower = new PImage[4];
  int fA;
  
  boolean up;
  boolean down;
  boolean left;
  boolean right;
  
  int health = 3;
  int invincible;
  
  float x;
  float y;
  float xV;
  float yV;
  float xF = 0;
  float yF = 0;
  
  float fX;
  float fY;
  boolean flowered;
  
  ArrayList<Pollen> pollen;
  boolean buffered;
  int cooldown;
  
  Player() {
    x = 400;
    y = 400;
    
    pollen = new ArrayList<Pollen>();
    
    PImage spriteSheet = loadImage("blueButterfly.png");
    sprite[0] = spriteSheet.get(16, 0, 16, 16);
    sprite[1] = spriteSheet.get(32, 0, 16, 16);
    sprite[2] = spriteSheet.get(48, 0, 16, 16);
    sprite[3] = spriteSheet.get(0, 0, 16, 16);
    spriteSheet = loadImage("brightButterfly.png");
    bright[0] = spriteSheet.get(16, 0, 16, 16);
    bright[1] = spriteSheet.get(32, 0, 16, 16);
    bright[2] = spriteSheet.get(48, 0, 16, 16);
    bright[3] = spriteSheet.get(0, 0, 16, 16);
    spriteSheet = loadImage("blueFlower.png");
    flower[0] = spriteSheet.get(0, 0, 16, 16);
    flower[1] = spriteSheet.get(16, 0, 16, 16);
    flower[2] = spriteSheet.get(32, 0, 16, 16);
    flower[3] = spriteSheet.get(48, 0, 16, 16);
  }
  
  void update() {
    float horizontal = (left ? -1 : 0) + (right ? 1 : 0);
    float vertical = (up ? -1 : 0) + (down ? 1 : 0);
    if(horizontal == 0) {
      if(abs(xV) <= DECELERATION) {
        xV = 0;
      } else {
        xV -= DECELERATION * (xV/abs(xV));
      }
    } else {
      xV += ACCELERATION * horizontal;
      xV = constrain(xV, -MAX_SPEED, MAX_SPEED);
    }
    if(vertical == 0) {
      if(abs(yV) <= DECELERATION) {
        yV = 0;
      } else {
        yV -= DECELERATION * (yV/abs(yV));
      }
    } else {
      yV += ACCELERATION * vertical;
      yV = constrain(yV, -MAX_SPEED, MAX_SPEED);
    }
    xF -= xF/(abs(xF) + 1) * (FORCE_DECAY + -horizontal * FORCE_DECAY * FORCE_CONTROLL);
    yF -= yF/(abs(yF) + 1) * (FORCE_DECAY + -vertical * FORCE_DECAY * FORCE_CONTROLL);
    x += xV + xF;
    y += yV + yF;
    
    cooldown--;
    ArrayList<Pollen> deathNote = new ArrayList<Pollen>();
    for(Pollen p : pollen) { //i hate this so much
      if(p.update()) {
        deathNote.add(p);
      }
    }
    for(Pollen p : deathNote) {
       pollen.remove(p); 
    }
  }
  
  void draw() {
    push();
      imageMode(CENTER);
      for(Pollen p : pollen) {
        p.draw();
      }
      if(flowered) {
        push();
          translate(fX, fY);
          image(flower[fA/FLOWER_ANIMATION_SPEED], 0, 0, 50, 50);
          fA++;
          if(fA >= FLOWER_ANIMATION_SPEED * 4) {
            fA = 0;
          }
        pop();
      }
      if(trailTimer > 1) {
          push();
            if(a % 2 == 0) {
              if(abs(xF) > 1 || abs(yF) > 1) {
                trailTimer = trail.length;
              } else {
                trailTimer--;
              }
              for(int i = 0; i < trailTimer - 1; i++) {
                 trail[i][0] = trail[i + 1][0];
                 trail[i][1] = trail[i + 1][1];
              }
              trail[trailTimer - 1][0] = x;
              trail[trailTimer - 1][1] = y;
            }
            for(int i = trailTimer - 1; i >= 0; i--) {
              tint(0, 255, 255, 255/2);
              image(bright[max(a, 0)/ANIMATION_SPEED], trail[i][0], trail[i][1], 50, 50);
            }
          pop();
        }
      push();
        translate(x, y);
        if(invincible <= 0 || floor(invincible/INVINCIBLE_FlASH) % 2 == 0) {
          image(sprite[max(a, 0)/ANIMATION_SPEED], 0, 0, 50, 50);
        } else {
          image(bright[max(a, 0)/ANIMATION_SPEED], 0, 0, 50, 50);
        }
        a++;
        if(a >= ANIMATION_SPEED * 4) {
          a = -ANIMATION_SPEED;
        }
      pop();
    pop();
  }
  
  void collide(ArrayList<Bullet> bullets) {
    println(health);
    if(invincible > 0) {
      invincible--;
      return;
    }
    for(Bullet bullet : bullets) {
      if(bullet.distance(x, y) < 20) {
        health--;
        invincible = INVINCIBLE_FRAMES;
        return;
      }
    }
  }
  
  void spawnFlower() {
    if(flowered) {
      if(dist(x, y, fX, fY) >= 50) {
        x = fX;
        y = fY;
      } else {
        for(float[] i : trail) {
          i[0] = x;
          i[1] = y;
        }
        trailTimer = trail.length;
        xF = (x - fX) * EXPLOSION_MAGNITUDE;
        yF = (y - fY) * EXPLOSION_MAGNITUDE;
      }
    } else {
      fX = x;
      fY = y;
    }
    flowered = !flowered;
  }
  
  void keyPressed() {
    switch(key) {
      case 'w': case 'W':
        up = true;
      break;
      case 's': case 'S':
        down = true;
      break;
      case 'a': case 'A':
        left = true;
      break;
      case 'd': case 'D':
        right = true;
      break;
      case '1': case 'z': case'e': case'!': case'Z': case'E': case'Q': case'q':
        spawnFlower();
      break;
      case '2': case 'x': case'@': case'X': case ' ': 
         pollen.add(new Pollen(x + random(-10, 10), y + random(-10, 10)));
      break;
    }
    if(key == CODED) {
      switch(keyCode) {
        case UP:
          up = true;
        break;
        case DOWN:
          down = true;
        break;
        case LEFT:
          left = true;
        break;
        case RIGHT:
          right = true;
        break;
        case SHIFT: case CONTROL:
          spawnFlower();
        break;
      }
    }
  }
  
  void keyReleased() {
     switch(key) {
      case 'w': case 'W':
        up = false;
      break;
      case 's': case 'S':
        down = false;
      break;
      case 'a': case 'A':
        left = false;
      break;
      case 'd': case 'D':
        right = false;
      break;
    }
    if(key == CODED) {
      switch(keyCode) {
        case UP:
          up = false;
        break;
        case DOWN:
          down = false;
        break;
        case LEFT:
          left = false;
        break;
        case RIGHT:
          right = false;
        break;
      }
    }
  }
}
