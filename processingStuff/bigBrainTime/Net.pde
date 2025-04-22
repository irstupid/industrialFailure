class Net
{
  int[] in;
  Neuron[][] net;
  Neuron[] out;
  
  ArrayList<Neuron[]> temp;
  int tempFunction;
  
  Net(int input, int output, int outFunction)
  {
    in = new int[input];
    out = new Neuron[output];
    temp = new ArrayList<Neuron[]>();
    tempFunction = outFunction;
  }
  
  Net addLayer(int amount, int function)
  {
    Neuron[] newLayer = new Neuron[amount];
    for(int i = 0; i < newLayer.length; i++)
    {
      newLayer[i] = new Neuron(function);
    }
    temp.add(newLayer);
    return this;
  }
  
  Net build()
  {
    net = new Neuron[temp.size()][];
    for(int i = 0; i < temp.size(); i++)
    {
      Neuron[] current = temp.get(i);
      for(int j = 0; j < current.length; j++)
      {
        if(i == 0)
        {
          current[i] = new Neuron(in.length, current[i].getFunction());
        }
        else
        {
          current[i] = new Neuron(net[i - 1].length, current[i].getFunction());
        }
      }
      net[i] = current;
    }
    for(int i = 0; i < out.length; i++)
    {
      if(net.length == 0)
      {
        out[i] = new Neuron(in.length, tempFunction);
      }
      else
      {
        out[i] = new Neuron(net[net.length - 1].length, tempFunction);
      }
    }
    temp = null;
    tempFunction = 0;
    return this;
  }
  
  void draw()
  {
    push();
      push();
        translate(0, -in.length * 30);
        for(int i = 0; i < in.length; i++)
        {
          circle(0, i * 60, 50);
        }
      pop();
      for(int i = 0; i < net.length; i++)
      {
        translate(120, 0);
        push();
          translate(0, -net[i].length * 30);
          for(int j = 0; j < net[i].length; j++)
          {
            circle(0, j * 60, 50);
          }
        pop();
      }
      translate(120, 0);
      push();
      translate(0, -out.length * 30);
        for(int i = 0; i < out.length; i++)
        {
          circle(0, i * 60, 50);
        }
     pop();
   pop();
  }
}
