import com.sun.net.httpserver.HttpServer;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.util.concurrent.Executors;

class Main
{
    public static void main(String[] args)
    {
        HttpServer server = null;
        try
        {
            server = HttpServer.create(new InetSocketAddress(3000), 0);
            server.setExecutor(Executors.newCachedThreadPool());
        }
        catch(IOException e){ }
        server.createContext("/", new Page());
        server.createContext("/Input", new Input());
        server.createContext("/Stream", new Stream());
        server.setExecutor(null);
        server.start();
        System.out.println("server running");
    }
}