class Map<T>
{
  JSONObject rawMap;
  T[][] map;
  T[] map1D;
  HashMap<String, T> library;
  
  Map(JSONObject map)
  {
    rawMap = map;
    library = new HashMap<>();
  }
  
  Map build()
  {
    map = (T[][]) new Object[rawMap.getInt("width")][rawMap.getInt("height")];
    JSONArray tileMap = rawMap.getJSONArray("map");
    for(int i = 0; i < tileMap.size(); i++)
    {
      JSONObject tile = tileMap.getJSONObject(i);
      int x = tile.getInt("x");
      int y = tile.getInt("y");
      T type = library.get(tile.getString("tile"));
      map[x][y] = type;
    }
    
    //map1D = (T[]) new Object[map.length * map[0].length];
    //int i = 0;
    //for(int x = 0; x < map.length; x++)
    //{
    //  for(int y = 0; y < map[x].length; y++)
    //  {
    //    map1D[i] = map[x][y];
    //    i++;
    //  }
    //}
    
    return this;
  }
  
  T get(int x, int y)
  {
    return map[x][y];
  }
  
  T[][] get()
  {
    return map;
  }
  
  int getWidth()
  {
    return map.length;
  }
  
  int getHeight()
  {
    return map[0].length;
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
