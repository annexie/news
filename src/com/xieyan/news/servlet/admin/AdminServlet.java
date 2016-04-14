package com.xieyan.news.servlet.admin;

import com.xieyan.news.bean.Admin;
import com.xieyan.news.control.AdminController;
import com.xieyan.news.control.impl.AdminControllerImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 管理员登录的Servlet
 * Created by xieyan on 16/1/9.
 */
public class AdminServlet extends HttpServlet {

    transient static final Logger logger = LoggerFactory.getLogger(AdminServlet.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String type = req.getParameter("type");
        AdminController adminController = new AdminControllerImpl();
        if ("login".equals(type)) {

            String adminName = req.getParameter("adminName");
            String adminPassword = req.getParameter("adminPassword");

            Admin admin = new Admin(adminName, adminPassword);
            Admin result = adminController.login(admin);
            if (null != result) { //Admin登陆成功
                HttpSession session = req.getSession();//返回与当前request相关联的session，如果没有则在服务器端创建一个;
                session.setAttribute("ADMIN_LOGIN", admin);
                RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/jsp/admin-index.jsp");
                dispatcher.forward(req, resp);
            }
        }
    }
}
