
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import java.awt.AWTException;
import java.awt.Dimension;
import java.awt.Robot;
import java.awt.Toolkit;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Input implements HttpHandler
{
    Robot robot;
    Dimension screenSize;

    Input()
    {
        try
        {
            robot = new Robot();
        }
        catch(AWTException e) { }
        screenSize = Toolkit.getDefaultToolkit().getScreenSize();
    }

    @Override
    public void handle(HttpExchange exchange)
    {
        System.err.println("work?");
        if (!"POST".equals(exchange.getRequestMethod())) 
        {
            return;
        }

        String body = null;
        try
        {
            body = new String(exchange.getRequestBody().readAllBytes(), StandardCharsets.UTF_8);
        }
        catch(IOException e) { }
        int x = extractJsonInt(body, "x");
        int y = extractJsonInt(body, "y");
        int width = extractJsonInt(body, "width");
        int height = extractJsonInt(body, "height");
        int screenX = x * screenSize.width / width;
        int screenY = y * screenSize.height / height;
        robot.mouseMove(screenX, screenY);
    }

    private int extractJsonInt(String json, String key) 
    {
        Pattern pattern = Pattern.compile("\"" + key + "\":\\s*(\\d+)");
        Matcher matcher = pattern.matcher(json);
        if (matcher.find()) 
        {
            return Integer.parseInt(matcher.group(1));
        }
        return 0;
    }
}
