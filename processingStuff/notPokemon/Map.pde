class Map<T>
{
  T[] map;
  T[] library;
  
  Map()
  {
    library = (T[]) new Object[0];
  }
  
  Map add(T entry)
  {
    if(library != null)
    {
      library = (T[])append(library, entry);
    }
    
    return this;
  }
  
  T[] readLibrary()
  {
    return library;
  }
}
