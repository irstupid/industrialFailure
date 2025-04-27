class Net
{
  int[] in;
  Neuron[][] net;
  Neuron[] out;
  
  int totalNeurons = 0;
  
  ArrayList<Neuron[]> temp;
  int tempFunction;
  
  Net(int input, int output, int outFunction)
  {
    totalNeurons += input + output;
    in = new int[input];
    out = new Neuron[output];
    temp = new ArrayList<Neuron[]>();
    tempFunction = outFunction;
  }
  
  Net addLayer(int amount, int function)
  {
    totalNeurons += amount;
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
  
  void update()
  {
    
  }
  
  void draw()
  {
    float localX = 0;
    float localY = 0;
    float[][] positions = new float[totalNeurons][2];
    localY += -in.length * 30;
    for(int i = 0; i < in.length; i++)
    {
      positions[i][0] = localX;
      positions[i][1] = localY + i * 60;
    }
    localY = 0;
    int offset = 0;
    for(int i = 0; i < net.length; i++)
    {
      localX += 120;
      localY += -net[i].length * 30;
      for(int j = 0; j < net[i].length; j++)
      {
        positions[in.length + offset][0] = localX;
        positions[in.length + offset][1] = localY + j * 60;
        offset++;
      }
      localY = 0;
    }
    localX += 120;
    localY += -out.length * 30;
    for(int i = 0; i < out.length; i++)
    {
      positions[totalNeurons - out.length + i][0] = localX;
      positions[totalNeurons - out.length + i][1] = localY + i * 60;
    }
    
    push();
      for(int i = 0; i < positions.length - out.length; i++)
      {
        for(int j = i; j < positions.length; j++) //very inefeicant
        {
          if(positions[j][0] - positions[i][0] == 120)
          {
            line(positions[i][0], positions[i][1], positions[j][0], positions[j][1]);
          }
        }
      }
      for(int i = 0; i < positions.length; i++)
      {
        //if(positions[i][0] == 0)
        //{
        //  fill(in[i] * 255);
        //}
        circle(positions[i][0], positions[i][1], 50);
      }
    pop();
  }
}
