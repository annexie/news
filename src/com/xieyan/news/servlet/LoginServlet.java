package com.xieyan.news.servlet;

import com.xieyan.news.bean.User;
import com.xieyan.news.control.UserControl;
import com.xieyan.news.control.impl.UserControlImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;

/**
 * 登录Servlet
 * Created by xieyan on 16/1/6.
 */
public class LoginServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //根据用户信息查找用户
        UserControl userInter = new UserControlImpl();
        User user = userInter.login(username, password);

        if (user != null) {

            // 将用户存放到session中去
            request.getSession().setAttribute("user", user);

            response.sendRedirect("news/jsp/news-list.jsp");

        } else {
            JOptionPane.showMessageDialog(null, "请输入正确的用户名密码！");
            response.sendRedirect("news/jsp/login.jsp");
        }
    }
}
