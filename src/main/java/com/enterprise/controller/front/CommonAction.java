package com.enterprise.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 * 公共控制器
 */
@Controller("commonAction")
public class CommonAction {
    private static int imageWidth = 100;
    private static int imageHeight = 36;
    private static int codeNumber = 4;
    private static int backGround = 30;

    @RequestMapping("getVerificationCode")
    public void getVerificationCode(HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
        BufferedImage bufferedImage = new BufferedImage(imageWidth,
                imageHeight, BufferedImage.TYPE_INT_BGR);
        Graphics2D g = bufferedImage.createGraphics();
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, imageWidth - 1, imageHeight -1 );
        Random random = new Random();
        for (int i = 0; i < backGround; i++) {
            int red = random.nextInt(256);
            int green = random.nextInt(256);
            int blue = random.nextInt(256);
            g.setColor(new Color(red, green, blue));
            int start_X = random.nextInt(imageWidth);
            int start_Y = random.nextInt(imageHeight);
            if (random.nextInt(5) % 3 == 0) {
                int r = random.nextInt(10);
                int startAngle = random.nextInt(360);
                int arcAngle = random.nextInt(360);
                g.drawArc(start_X, start_Y, r, r, startAngle, arcAngle);
            } else {
                int change_X = random.nextInt() % 6;
                int change_Y = random.nextInt() % 6;
                g.drawLine(start_X, start_Y, start_X + change_X, start_Y
                        + change_Y);
            }
        }
        StringBuilder ValidateCode = new StringBuilder();
        g.setFont(new Font("Tahoma", Font.BOLD, imageHeight - 3));
        for (int i = 0; i < codeNumber; i++) {
            int red = random.nextInt(100) + 50;
            int green = random.nextInt(100) + 50;
            int blue = random.nextInt(100) + 50;
            g.setColor(new Color(red, green, blue));
            String code = null;
            int type = random.nextInt(3);
            if (type == 1) {
                code = String.valueOf((char) (random.nextInt(26) + 65));
            } else if (type == 2) {
                code = String.valueOf((char) (random.nextInt(26) + 97));
            } else {
                code = String.valueOf(random.nextInt(10));
            }
            ValidateCode.append(code);
            g.drawString(code, imageWidth / codeNumber * i , 27);
        }
        request.getSession().setAttribute("validateCode",
                ValidateCode.toString());
        ServletOutputStream sos = response.getOutputStream();
        ImageIO.write(bufferedImage, "jpeg", sos);
        sos.close();
    }

}
