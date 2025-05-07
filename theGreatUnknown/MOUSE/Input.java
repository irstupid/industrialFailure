import com.sun.net.httpserver.*;
import java.awt.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.regex.*;

public class Input implements HttpHandler {
    private Robot robot = null;
    private final Dimension screenSize;

    public Input()
    {
        try
        {
            robot = new Robot();
        }
        catch(AWTException e) { }
        screenSize = Toolkit.getDefaultToolkit().getScreenSize();
    }

    @Override
    public void handle(HttpExchange exchange) throws IOException {
        System.out.println("Received " + exchange.getRequestMethod() + " " + exchange.getRequestURI());
        if (!"POST".equalsIgnoreCase(exchange.getRequestMethod())) {
            exchange.sendResponseHeaders(405, -1);
            return;
        }

        // read JSON
        String body = new String(exchange.getRequestBody().readAllBytes(), StandardCharsets.UTF_8);
        int x = parse(body, "x");
        int y = parse(body, "y");
        int w = parse(body, "width");
        int h = parse(body, "height");

        // scale to desktop
        int dx = x * screenSize.width / w;
        int dy = y * screenSize.height / h;
        robot.mouseMove(dx, dy);

        // send a quick OK
        byte[] resp = "OK".getBytes();
        exchange.sendResponseHeaders(200, resp.length);
        exchange.getResponseBody().write(resp);
        exchange.close();
    }

    private int parse(String json, String key) {
        Matcher m = Pattern.compile("\"" + key + "\":\\s*(\\d+)").matcher(json);
        return m.find() ? Integer.parseInt(m.group(1)) : 0;
    }
}