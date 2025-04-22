Net net;

void setup()
{
  size(800, 800);
  net = new Net(4, 2, 0)
    .addLayer(6, 0)
    .addLayer(4, 0)
    .build();
}

void draw()
{
  translate(width/2, height/2);
  net.draw();
}
