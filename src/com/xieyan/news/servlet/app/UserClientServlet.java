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

/**
 * 登录Servlet
 * Created by xieyan on 16/1/6.
 */
public class UserClientServlet extends BaseServlet {

    transient static final Logger logger = LoggerFactory.getLogger(UserClientServlet.class);


    public String login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //根据用户信息查找用户
        UserController userInter = new UserControllerImpl();
        User user = userInter.login(username, password);

        if (user != null) {

            // 将用户存放到session中去
            request.getSession().setAttribute("user", user);

            return "news/jsp/user-list.jsp";

        } else {
//            JOptionPane.showMessageDialog(null, "请输入正确的用户名密码！");
//            response.sendRedirect("news/jsp/login.jsp");

            return "news/jsp/login.jsp";
        }
    }
}
