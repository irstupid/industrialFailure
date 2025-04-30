import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import java.awt.AWTException;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.ImageOutputStream;

public class Site implements HttpHandler
{
    @Override
    public void handle(HttpExchange exchange)
    {
        Robot robot = null;
        try
        {
            robot = new Robot();
        }
        catch(AWTException e) { }
        Headers headers = exchange.getResponseHeaders();
        headers.set("Content-Type", "multipart/x-mixed-replace; boundary=--frame");
        try
        {
            exchange.sendResponseHeaders(200, 0);
        }
        catch(IOException e) { }
        OutputStream os = exchange.getResponseBody();

        while (true) 
        { 
            Rectangle capture = new Rectangle(Toolkit.getDefaultToolkit().getScreenSize()); 
            BufferedImage screen = robot.createScreenCapture(capture);
            Image scaled = screen.getScaledInstance(960, 540, Image.SCALE_FAST);
            BufferedImage resized = new BufferedImage(960, 540, BufferedImage.TYPE_INT_RGB);
            Graphics2D g = resized.createGraphics();
            g.drawImage(scaled, 0, 0, null);
            g.dispose();

            Iterator<ImageWriter> writers = ImageIO.getImageWritersByFormatName("jpeg");
            ImageWriter writer = writers.next();

            ImageWriteParam lowQuality = writer.getDefaultWriteParam();
            lowQuality.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
            lowQuality.setCompressionQuality(0.4f);

            byte[] bytes = null;
            try
            {
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                ImageOutputStream out = ImageIO.createImageOutputStream(baos);
                writer.setOutput(out);
                writer.write(null, new IIOImage(resized, null, null), lowQuality);
                out.close();
                writer.dispose();
                bytes = baos.toByteArray();
            }
            catch(IOException e) { }

            try
            {
                PrintWriter pw = new PrintWriter(os, false);
                pw.println("--frame");
                pw.println("Content-Type: image/jpeg");
                pw.println("Content-Length: " + bytes.length);
                pw.println();
                pw.flush();
                os.write(bytes);
                os.flush();
            }
            catch(IOException e) { }
        }
    }
}