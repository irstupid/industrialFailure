import processing.net.*;

class Network {
  Server theServer;
  Client theClient;
  PApplet ap;
  
  Network(PApplet ap) {
    this.ap = ap;
    this.theServer = null;
    this.theClient = null;
  }
  
  boolean startServer() {
    theServer = new Server(ap, 5204);
    if (theServer == null) {
      println("could not start a server");
      return false;
    }
    
    return true;
  }
  
  String getNext() {
    Client c;      
    String s;
    
    if (theServer == null)
      return null;
      
    c = theServer.available();
    if (c == null)
      return null;
      
    s = c.readStringUntil(0);
    s = trimString(s);
    return s;
  }
  
  void broadcast(String s) {
    if (theServer == null) {
      println("Can not broadcast, no server");
      return;
    }
    println("Broadcast " + s);
    theServer.write(s);
    theServer.write(0);    
  }
  
  boolean startClient(String serverIp) {
    theClient = new Client(ap, serverIp, 5204); 
    if (theClient == null) {
      println("Could not start client, not connected to server");
      return false;
    }
    
    return true;
  }
  
  void putString(String s) {
    if (theClient == null) {
      println("No client");
      return;
    }
    
    theClient.write(s);
    theClient.write(0);
    println("put string " + s);
  }
  
  String getString() {
    String s = null;
    if (theClient == null) {
      println("no client");
      return null;
    }
    s = theClient.readStringUntil(0);
    s = trimString(s);
    if (s != null)
       println("got string " + s);
    return s;
  }
  
  String trimString(String s) {
    if (s == null) {
      return null;
    }
    
    if (s.length() < 1) {
      return null;
    }
    
    if (s.length() < 2 && int(s.charAt(0)) == 0) {
      return null;
    }
    
    s = s.substring(0, s.length()-1);
    
    return s;
  }
}
