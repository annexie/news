package com.xieyan.news.servlet.admin;

import com.xieyan.news.bean.Admin;
import com.xieyan.news.control.AdminController;
import com.xieyan.news.control.impl.AdminControllerImpl;
import com.xieyan.news.utils.CheckAdminLoginUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

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
            Admin result = null;
            try {
                result = adminController.login(admin);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (null != result) { //Admin登陆成功
                HttpSession session = req.getSession();//返回与当前request相关联的session，如果没有则在服务器端创建一个;
                session.setAttribute("ADMIN_LOGIN", admin);
                RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/jsp/admin-index.jsp");
                dispatcher.forward(req, resp);
            }
        } else if ("list".equals(type)) {

            //判断管理员是否登录，如果未登录进入登录界面
            CheckAdminLoginUtil.CheckAdminLoginUtil(req, resp);

            //获取用去请求参数
            String adminName = req.getParameter("adminName");
            String adminRole = req.getParameter("adminRole");

            List<Admin> list = null;
            try {
                list = adminController.listAdmin(adminName, adminRole);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("adminList", list);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/jsp/admin-list.jsp");
            dispatcher.forward(req, resp);

        } else if ("add".equals(type)) {

            //判断管理员是否登录，如果未登录进入登录界面
            CheckAdminLoginUtil.CheckAdminLoginUtil(req, resp);

            String adminName = req.getParameter("adminName");
            String adminPassword = req.getParameter("adminPassword");
            String adminRole = req.getParameter("adminRole");

            Admin admin = new Admin(adminName, adminPassword, Integer.parseInt(adminRole));
            try {
                int flag = adminController.addAdmin(admin);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else if ("delete".equals(type)) {

            //判断管理员是否登录，如果未登录进入登录界面
            CheckAdminLoginUtil.CheckAdminLoginUtil(req, resp);

            String id = req.getParameter("id");

            try {
                boolean flag = adminController.delete(Long.parseLong(id));
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else if ("update".equals(type)) {

            //判断管理员是否登录，如果未登录进入登录界面
            CheckAdminLoginUtil.CheckAdminLoginUtil(req, resp);

            String adminName = req.getParameter("adminName");
            String adminRole = req.getParameter("adminRole");
            String id = req.getParameter("id");

            Admin admin = new Admin(adminName, Integer.parseInt(adminRole), Long.parseLong(id));
            try {
                boolean flag = adminController.updateAdmin(admin);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            //TODO 判断修改的用户是否是自己，如果是自己的话 还需要在session中重新加入
        }
    }
}
