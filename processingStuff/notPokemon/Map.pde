class Map<T>
{
  T[] map;
  T[] library;
  String[] tags;
  
  Map()
  {
    library = (T[]) new Object[0];
    tags = new String[0];
  }
  
  Map add(T entry)
  {
    if(library != null)
    {
      library = (T[])append(library, entry);
    }
    tags = (String[])append(tags, "");
    
    return this;
  }
  
  Map add(T entry, String tag)
  {
    if(library != null)
    {
      library = (T[])append(library, entry);
    }
    tags = (String[])append(tags, tag);
    
    return this;
  }
  
  T[] getLibrary()
  {
    return library;
  }
  
  T getLibrary(int index)
  {
    return library[index];
  }
  
  T getLibrary(String tag)
  {
    int i;
    for(i = 0; i < tags.length; i++)
    {
      if(tags[i].equals(tag))
      {
        return library[i];
      }
    }
    throw(new RuntimeException("incorrect tag"));
  }
}
