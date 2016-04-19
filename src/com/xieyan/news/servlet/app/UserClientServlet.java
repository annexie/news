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

        //判断两次输入的密码是否相同
        if (password.equals(checkPassword)) {

            User user = new User();
            user.setUserName(username);
            user.setUserPassword(password);
            user.setValid("1");
            UserController userController = new UserControllerImpl();
            if (userController.register(user)) {
                out.write("success");
            } else {
                out.write("failed");
            }
        } else {
            out.write("repwdError");
        }
    }

    public String login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //根据用户信息查找用户
        UserController userInter = new UserControllerImpl();
        User user = userInter.login(username, password);

        if (user != null) {

            // 将用户存放到session中去
            request.getSession().setAttribute("CLIENT_USER", user);

            return "news/jsp/user-list.jsp";

        } else {

            return "news/jsp/login.jsp";
        }
    }
}
