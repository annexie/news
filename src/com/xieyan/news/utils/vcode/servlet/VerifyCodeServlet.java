package com.xieyan.news.utils.vcode.servlet;

import com.xieyan.news.servlet.BaseServlet;
import com.xieyan.news.utils.vcode.utils.VerifyCode;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;

@SuppressWarnings("serial")
public class VerifyCodeServlet extends BaseServlet {

    /**
     * 生成验证码并返回
     */
    public void getCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        VerifyCode vc = new VerifyCode();
        BufferedImage image = vc.getImage();//获取一次性验证码图片
        // 该方法必须在getImage()方法之后来调用
//		System.out.println(vc.getText());//获取图片上的文本
        VerifyCode.output(image, response.getOutputStream());//把图片写到指定流中

        // 把文本保存到session中，为LoginServlet验证做准备
        request.getSession().setAttribute("vCode", vc.getText());
    }

    /**
     * 通过Ajax验证输入的验证码
     */
    public void checkCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();//后台向前台打印输出的对象

        //获取缓存中存放的真实的验证码
        String realVerifyCode = (String) request.getSession().getAttribute("vCode");

        //获取前端传入的输入的验证码
        String vrifyCodev = request.getParameter("verifyCode");
        if (realVerifyCode.equalsIgnoreCase(vrifyCodev)) { //验证码输入正确
            out.write("1"); //验证成功
        } else {
            out.write("0");//验证失败
        }
    }
}
