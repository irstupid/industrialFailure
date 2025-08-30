World world;
UI ui;

int weight = 2;
int w = 50;
int h = 50;

int convayerA;
int convayerASpeed = 10;

void setup()
{
  size(600, 500);
  world = new World();
  ui = new UI();
}

void draw()
{
  world.tick();
  
  background(#eeeeee);
  world.draw();
  ui.draw();
}

void keyPressed()
{
  ui.keyPressed();
}

void mousePressed()
{
  int x = mouseX/w;
  int y = mouseY/h;
  x = min(x, (width  - 100)/w - 1);
  y = min(y, height/h - 1);
  world.set(ui.mousePressed(x, y), x, y);
}

void drawTile(Tile tile, int x, int y)
{
  switch(tile)
  {
    case EMPTY:
      rect(x * w + weight/2, y * h + weight/2, w - weight, h - weight);
    break;
    case DOT:
      rect(x * w + weight/2, y * h + weight/2, w - weight, h - weight);
      for(int i = 0; i < 3; i++)
      {
        for(int j = 0; j < 3; j++)
        {
          strokeWeight(weight * 2);
          point(x * w + (w/3.5) * i + (w/4.5), y * w + (h/3.5) * j + (h/4.5));
        }
      }
    break;
    case STRIPE:
      line(x * w + (w - weight/2)/2, y * h, x * w + (w - weight/2), y * h + (h - weight/2)/2);
      line(x * w, y * h, x * w + (w - weight/2), y * h + (h - weight/2));
      line(x * w + (w - weight/2)/2, y * h + (h - weight/2), x * w, y * h + (h - weight/2)/2);
      rect(x * w + weight/2, y * h + weight/2, w - weight, h - weight);
    break;
    case SOLID:
      fill(#0004a6, 255/2);
      rect(x * w + weight/2, y * h + weight/2, w - weight, h - weight);
    break;
    case UP_CONVAYER:
      push();
        translate(x * w + weight/2, y * h + weight/2);
        line(0, 0, 0, h);
        line(w - weight/2, 0, w - weight/2, h);
        line(0, h/4 * 1 - convayerA, w, h/4 * 1 - convayerA);
        line(0, h/4 * 2 - convayerA, w, h/4 * 2 - convayerA);
        line(0, h/4 * 3 - convayerA, w, h/4 * 3 - convayerA);
        line(0, h/4 * 4 - convayerA, w, h/4 * 4 - convayerA);
      pop();
    break;
    case DOWN_CONVAYER:
      push();
        translate(x * w + weight/2, y * h + weight/2);
        line(0, 0, 0, h);
        line(w - weight/2, 0, w - weight/2, h);
        line(0, h/4 * 0 + convayerA, w, h/4 * 0 + convayerA);
        line(0, h/4 * 1 + convayerA, w, h/4 * 1 + convayerA);
        line(0, h/4 * 2 + convayerA, w, h/4 * 2 + convayerA);
        line(0, h/4 * 3 + convayerA, w, h/4 * 3 + convayerA);
      pop();
    break;
    case LEFT_CONVAYER:
      push();
        translate(x * w + weight/2, y * h + weight/2);
        line(0, 0, w, 0);
        line(0, h - weight/2, w, h - weight/2);
        line(w/4 * 1 - convayerA, 0, w/4 * 1 - convayerA, h);
        line(w/4 * 2 - convayerA, 0, w/4 * 2 - convayerA, h);
        line(w/4 * 3 - convayerA, 0, w/4 * 3 - convayerA, h);
        line(w/4 * 4 - convayerA, 0, w/4 * 4 - convayerA, h);
      pop();
    break;
    case RIGHT_CONVAYER:
      push();
        translate(x * w + weight/2, y * h + weight/2);
        line(0, 0, w, 0);
        line(0, h - weight/2, w, h - weight/2);
        line(w/4 * 0 + convayerA, 0, w/4 * 0 + convayerA, h);
        line(w/4 * 1 + convayerA, 0, w/4 * 1 + convayerA, h);
        line(w/4 * 2 + convayerA, 0, w/4 * 2 + convayerA, h);
        line(w/4 * 3 + convayerA, 0, w/4 * 3 + convayerA, h);
      pop();
    break;
  }
}

enum Tile
{
  EMPTY,
  DOT,
  STRIPE,
  SOLID,
  UP_CONVAYER,
  DOWN_CONVAYER,
  LEFT_CONVAYER,
  RIGHT_CONVAYER,
  UP_LEFT_CONVAYER,
  UP_RIGHT_CONVAYER,
}
