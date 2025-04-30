import com.sun.net.httpserver.HttpServer;
import java.io.IOException;
import java.net.InetSocketAddress;

class Main
{
    public static void main(String[] args)
    {
        HttpServer server = null;
        try
        {
            server = HttpServer.create(new InetSocketAddress(3000), 0);
        }
        catch(IOException e){ }
        server.createContext("/", new Site());
        server.setExecutor(null);
        server.start();
        System.out.println("server running");
    }
}