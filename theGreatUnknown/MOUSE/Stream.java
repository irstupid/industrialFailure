import com.sun.net.httpserver.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.Iterator;
import javax.imageio.*;
import javax.imageio.stream.ImageOutputStream;

public class Stream implements HttpHandler {
    private static final int REZX = (int)(1920 * 0.7);
    private static final int REZY = (int)(1080 * 0.7);
    private static final float QUALITY = 0.6f;
    private static final int FRAME_DELAY_MS = 100; // ~10 FPS

    @Override
    public void handle(HttpExchange exchange) throws IOException {
        Robot robot;
        try {
            robot = new Robot();
        } catch (AWTException e) {
            e.printStackTrace();
            exchange.sendResponseHeaders(500, -1);
            return;
        }

        Headers resp = exchange.getResponseHeaders();
        resp.set("Content-Type", "multipart/x-mixed-replace; boundary=--frame");
        resp.set("Cache-Control", "no-cache");
        // no Connection: close here—keep the socket open for streaming

        exchange.sendResponseHeaders(200, 0);
        OutputStream os = exchange.getResponseBody();
        Rectangle screenRect = new Rectangle(Toolkit.getDefaultToolkit().getScreenSize());

        try {
            while (true) {
                // 1. capture
                BufferedImage cap = robot.createScreenCapture(screenRect);

                // 2. resize
                Image tmp = cap.getScaledInstance(REZX, REZY, Image.SCALE_FAST);
                BufferedImage resized = new BufferedImage(REZX, REZY, BufferedImage.TYPE_INT_RGB);
                Graphics2D g = resized.createGraphics();
                g.drawImage(tmp, 0, 0, null);
                g.dispose();

                // 3. encode JPEG in memory
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                ImageOutputStream ios = ImageIO.createImageOutputStream(baos);
                Iterator<ImageWriter> writers = ImageIO.getImageWritersByFormatName("jpeg");
                ImageWriter writer = writers.next();
                ImageWriteParam param = writer.getDefaultWriteParam();
                param.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
                param.setCompressionQuality(QUALITY);
                writer.setOutput(ios);
                writer.write(null, new IIOImage(resized, null, null), param);
                ios.close();
                writer.dispose();
                byte[] jpegData = baos.toByteArray();

                // 4. send a frame
                PrintWriter pw = new PrintWriter(os, false);
                pw.println("--frame");
                pw.println("Content-Type: image/jpeg");
                pw.println("Content-Length: " + jpegData.length);
                pw.println();
                pw.flush();

                os.write(jpegData);
                os.flush();

                // 5. rate‑limit
                Thread.sleep(FRAME_DELAY_MS);
            }
        } catch (IOException | InterruptedException e) {
            // client likely disconnected or thread interrupted
            System.out.println("Stream ended: " + e.getMessage());
        } finally {
            os.close();
        }
    }
}
