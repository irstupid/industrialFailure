class Map<T>
{
  T[][] map;
  HashMap<String, T> library;
  
  Map()
  {
    library = new HashMap<>();
  }
  
  Map add(T entry, String tag)
  {
    library.put(tag, entry);
    
    return this;
  }
  
  HashMap<String, T> getLibrary()
  {
    return library;
  }
  
  T getLibrary(String tag)
  {
    return library.get(tag);
  }
}
