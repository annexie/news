package com.xieyan.news.servlet.app;

import com.xieyan.news.bean.User;
import com.xieyan.news.control.UserController;
import com.xieyan.news.control.impl.UserControllerImpl;
import com.xieyan.news.servlet.BaseServlet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 登录Servlet
 * Created by xieyan on 16/1/6.
 */
public class UserClientServlet extends BaseServlet {

    transient static final Logger logger = LoggerFactory.getLogger(UserClientServlet.class);

    public void register(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String checkPassword = request.getParameter("re_password");

        //获取前台输出对象
        PrintWriter out = response.getWriter();

        if (username.equals("") || password.equals("") || checkPassword.equals("")) { //用户名密码为空
            out.write("failed");
            return;
        }

        //判断两次输入的密码是否相同
        if (password.equals(checkPassword)) {

            User user = new User();
            user.setUserName(username);
            user.setUserPassword(password);
            user.setValid("1");
            UserController userController = new UserControllerImpl();
            if (userController.register(user)) {
                out.write("success");//向前端写数据
            } else {
                out.write("failed");
            }
        } else {
            out.write("repwdError");
        }
    }

    public void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //获取前台输出对象
        PrintWriter out = response.getWriter();

        if (username.equals("") || password.equals("")) { //用户名密码为空
            out.write("failed");
            return;
        }

        //根据用户信息查找用户
        UserController userController = new UserControllerImpl();
        User user = userController.login(username, password);

        if (null != user) {
            // 将用户存放到session中去
            request.getSession().setAttribute("CLIENT_USER", user);
            out.write("success");
        } else {
            out.write("failed");
        }
    }
}
