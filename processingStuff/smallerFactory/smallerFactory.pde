World world;
UI ui;

int weight = 2;
int w = 50;
int h = 50;
int ink = #0004a6;
int background = #eeeeee;

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
  
  background(background);
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
  Tile tile = ui.mousePressed(x, y);
  if(tile == Tile.ASSEMBLER_TOP_LEFT)
  {
    if(world.map[x][y].index < 13 && world.map[x + 1][y].index < 13 && world.map[x][y + 1].index < 13 && world.map[x + 1][y + 1].index < 13)
    {
      world.set(tile, x, y);
      world.set(Tile.ASSEMBLER_TOP_RIGHT, x + 1, y);
      world.set(Tile.ASSEMBLER_BOTTOM_LEFT, x, y + 1);
      world.set(Tile.ASSEMBLER_BOTTOM_RIGHT, x + 1, y + 1);
    }
  }
  else if(tile != null)
  {
    world.set(tile, x, y);
  }
}

void mouseDragged()
{
  int x = mouseX/w;
  int y = mouseY/h;
  x = min(x, (width  - 100)/w - 1);
  y = min(y, height/h - 1);
  int[][] tiles = ui.mouseDragged(x, y);
  if(tiles != null)
  {
    for(int[] tile : tiles)
    {
      world.set(Tile.values()[tile[0]], tile[1], tile[2]);
    }
  }
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
      fill(ink, 255/2);
      rect(x * w + weight/2, y * h + weight/2, w - weight, h - weight);
    break;
    case UP_CONVAYER:
      push();
        translate(x * w + weight/2, y * h + weight/2);
        line(0, 0, 0, h);
        line(w - weight, 0, w - weight, h);
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
        line(w - weight, 0, w - weight, h);
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
        line(0, h - weight, w, h - weight);
        line(w/4 * 0 + convayerA, 0, w/4 * 0 + convayerA, h);
        line(w/4 * 1 + convayerA, 0, w/4 * 1 + convayerA, h);
        line(w/4 * 2 + convayerA, 0, w/4 * 2 + convayerA, h);
        line(w/4 * 3 + convayerA, 0, w/4 * 3 + convayerA, h);
      pop();
    break;
    case UP_LEFT_CONVAYER:
      push();
        translate(x * w + weight/2, y * h + weight/2);
        line(0, 0, w, 0);
        line(w - weight, 0, w - weight, h);
        arc(0, h, w * 2, h * 2, PI + HALF_PI, TWO_PI);
        line(0, h, (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 0) * w), h - (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 0) * h));
        line(0, h, (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 1) * w), h - (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 1) * h));
        line(0, h, (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 2) * w), h - (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 2) * h));
        line(0, h, (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 3) * w), h - (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 3) * h));
      pop();
    break;
    case UP_RIGHT_CONVAYER:
      push();
        translate(x * w + weight/2, y * h + weight/2);
        line(0, 0, w, 0);
        line(0, 0, 0, h);
        arc(w, h, w * 2, h * 2, PI, HALF_PI + PI);
        line(w, h, w - (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 0) * w), h - (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 0) * h));
        line(w, h, w - (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 1) * w), h - (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 1) * h));
        line(w, h, w - (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 2) * w), h - (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 2) * h));
        line(w, h, w - (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 3) * w), h - (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 3) * h));
      pop();
    break;
    case RIGHT_LEFT_CONVAYER:
      push();
        translate(x * w + weight/2, y * h + weight/2);
        line(0, h - weight, w, h - weight);
        line(w - weight, 0, w - weight, h);
        arc(0, 0, w * 2, h * 2, 0, HALF_PI);
        line(0, 0, (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 0) * w), (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 0) * h));
        line(0, 0, (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 1) * w), (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 1) * h));
        line(0, 0, (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 2) * w), (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 2) * h));
        line(0, 0, (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 3) * w), (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 3) * h));
      pop();
    break;
    case RIGHT_RIGHT_CONVAYER:
      push();
        translate(x * w + weight/2, y * h + weight/2);
        line(0, 0, w, 0);
        line(w - weight, 0, w - weight, h);
        arc(0, h, w * 2, h * 2, PI + HALF_PI, TWO_PI);
        line(0, h, (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 0) * w), h - (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 0) * h));
        line(0, h, (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 1) * w), h - (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 1) * h));
        line(0, h, (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 2) * w), h - (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 2) * h));
        line(0, h, (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 3) * w), h - (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 3) * h));
      pop();
    break;
    case DOWN_LEFT_CONVAYER:
      push();
        translate(x * w + weight/2, y * h + weight/2);
        line(0, h - weight, w, h - weight);
        line(0, 0, 0, h);
        arc(w, 0, w * 2, h * 2, HALF_PI, PI);
        line(w, 0, w - (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 0) * w), (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 0) * h));
        line(w, 0, w - (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 1) * w), (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 1) * h));
        line(w, 0, w - (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 2) * w), (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 2) * h));
        line(w, 0, w - (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 3) * w), (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 3) * h));
      pop();
    break;
    case DOWN_RIGHT_CONVAYER:
      push();
        translate(x * w + weight/2, y * h + weight/2);
        line(0, h - weight, w, h - weight);
        line(w - weight, 0, w - weight, h);
        arc(0, 0, w * 2, h * 2, 0, HALF_PI);
        line(0, 0, (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 0) * w), (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 0) * h));
        line(0, 0, (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 1) * w), (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 1) * h));
        line(0, 0, (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 2) * w), (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 2) * h));
        line(0, 0, (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 3) * w), (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 3) * h));
      pop();
    break;
    case LEFT_LEFT_CONVAYER:
      push();
        translate(x * w + weight/2, y * h + weight/2);
        line(0, 0, w, 0);
        line(0, 0, 0, h);
        arc(w, h, w * 2, h * 2, PI, HALF_PI + PI);
        line(w, h, w - (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 0) * w), h - (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 0) * h));
        line(w, h, w - (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 1) * w), h - (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 1) * h));
        line(w, h, w - (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 2) * w), h - (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 2) * h));
        line(w, h, w - (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 3) * w), h - (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 3) * h));
      pop();
    break;
    case LEFT_RIGHT_CONVAYER:
      push();
        translate(x * w + weight/2, y * h + weight/2);
        line(0, h - weight, w, h - weight);
        line(0, 0, 0, h);
        arc(w, 0, w * 2, h * 2, HALF_PI, PI);
        line(w, 0, w - (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 0) * w), (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 0) * h));
        line(w, 0, w - (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 1) * w), (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 1) * h));
        line(w, 0, w - (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 2) * w), (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 2) * h));
        line(w, 0, w - (sin(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 3) * w), (cos(convayerA/(w/4f) * HALF_PI/4 + HALF_PI/4 * 3) * h));
      pop();
    break;
    case ASSEMBLER_TOP_LEFT:
      push();
        strokeWeight(weight * 2);
        translate(x * w + weight, y * h + weight);
        rect(0, 0, 2 * w - 2 * weight, 2 * h - 2 * weight);
      pop();
    break;
    case ASSEMBLER_TOP_RIGHT:
    break;
    case ASSEMBLER_BOTTOM_LEFT:
    break;
    case ASSEMBLER_BOTTOM_RIGHT:
    break;
  }
}

enum Tile
{
  EMPTY (0),
  UP_CONVAYER (1, 2, 0),
  DOWN_CONVAYER (2, 0, 2),
  LEFT_CONVAYER (3, 1, 3),
  RIGHT_CONVAYER (4, 3, 1),
  UP_LEFT_CONVAYER (5, 2, 3),
  UP_RIGHT_CONVAYER (6, 2, 1),
  RIGHT_LEFT_CONVAYER (7, 3, 0),
  RIGHT_RIGHT_CONVAYER (8, 3, 2),
  DOWN_LEFT_CONVAYER (9, 0, 1),
  DOWN_RIGHT_CONVAYER (10, 0, 3),
  LEFT_LEFT_CONVAYER (11, 1, 2),
  LEFT_RIGHT_CONVAYER (12, 1, 0),
  ASSEMBLER_TOP_LEFT (13),
  ASSEMBLER_TOP_RIGHT (14),
  ASSEMBLER_BOTTOM_LEFT (15),
  ASSEMBLER_BOTTOM_RIGHT (16),
  DOT (17),
  STRIPE (18),
  SOLID (19);
  
  public final int index;
  public final int in;
  public final int out;
  
  Tile(int index)
  {
    this.index = index;
    in = 4;
    out = 4;
  }
  Tile(int index, int in, int out)
  {
    this.index = index;
    this.in = in;
    this.out = out;
  }
}
