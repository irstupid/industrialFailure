class Neuron
{
  float[] in;
  float out;
  
  int function;
  float[] weights;
  float bias;
  
  Neuron(int conections, int function)
  {
    in = new float[conections];
    out = 0;
    this.function = function;
    weights = new float[conections];
    bias = 0;
  }
  
  Neuron(int function)
  {
    in = null;
    out = 0;
    this.function = function;
    weights = null;
    bias = 0;
  }
  
  void update()
  {
    float weightedIn = 0;
    for(int i = 0; i < in.length; i++)
    {
      weightedIn += in[i] * weights[i];
    }
    weightedIn = weightedIn/in.length;
    out = function(weightedIn + bias);
  }
  
  float function(float value)
  {
    switch(function)
    {
      case 0: default:
        return value;
      case 1:
        return reLu(value);
      case 2:
        return sigmoid(value);
      case 3:
        return tanh(value);
    }
  }
  
  void setWeights(float[] value)
  {
    if(weights.length == value.length)
    {
      weights = value;
    }
  }
  
  void setWeight(int i, float value)
  {
    weights[i] = value;
  }
  
  void fullIn(float[] value)
  {
    if(weights.length == value.length)
    {
      in = value;
    }
  }
  
  void in(int i, float value)
  {
    in[i] = value;
  }
  
  float out()
  {
    return out;
  }
  
  int getFunction()
  {
    return function;
  }
  
  float tanh(float value)
  {
    float bottom = exp(value) - exp(-value);
    float top = exp(value) + exp(-value);
    return top/bottom;
  }
  
  float sigmoid(float value)
  {
    float bottom = exp(-value) + 1;
    return 1/bottom;
  }
  
  float reLu(float value)
  {
    return max(0, value);
  }
}
