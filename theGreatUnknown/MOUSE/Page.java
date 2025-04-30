
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;

public class Page implements HttpHandler
{
    @Override
    public void handle(HttpExchange exchange)
    {
        String page = null;
        try
        {
            page = Files.readString(Path.of("page.html"));
        }
        catch(IOException e) { }

        OutputStream out = exchange.getResponseBody();
        try
        {
            exchange.getResponseHeaders().set("Content-Type", "text/html");
            exchange.sendResponseHeaders(200, page.length());
            out.write(page.getBytes());
            out.close();
        }
        catch(IOException e) { }
    }
}
