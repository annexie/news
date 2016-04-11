package com.xieyan.news.servlet.admin;

import com.xieyan.news.bean.User;
import com.xieyan.news.control.UserControl;
import com.xieyan.news.control.impl.UserControlImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * 后台进行管理User的Servlet
 * Created by xieyan on 16/1/9.
 */
public class UserServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String type = request.getParameter("type");

        if ("list".equals(type)) { //列举用户信息,包含用户的搜索
            String username = request.getParameter("username");
            String valid = request.getParameter("valid");

            UserControl userControl = new UserControlImpl();
            List<User> userList = userControl.queryByCondition(username, valid);
            request.setAttribute("userList", userList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/jsp/user-list.jsp");
            dispatcher.forward(request, response);

        } else if ("add".equals(type)) {  //添加用户
            System.out.println(request.getParameter("username"));
            System.out.println(request.getParameter("password"));
            PrintWriter out = response.getWriter();
            out.print("success");
        } else if ("update".equals(type)) { //修改用户

            //获取前台传入的参数
            String id = request.getParameter("id").trim();
            String username = request.getParameter("username").trim();
            String valid = request.getParameter("valid").trim();

            //封装成User对象
            User user = new User(Long.parseLong(id), username, valid);
            //进行更新操作
            UserControl userControl = new UserControlImpl();
            userControl.update(user);

            //返回前端新的用户列表信息
            List<User> userList = userControl.queryByCondition("", "");
            request.setAttribute("userList", userList);

            //返回前台成功消息
            request.setAttribute("updateFlag", true);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/jsp/user-list.jsp");
            dispatcher.forward(request, response);
        } else if ("delete".equals(type)) {//删除用户
            //获取前台传入的参数
            String id = request.getParameter("id").trim();

            UserControl userControl = new UserControlImpl();
            if (userControl.delete(id)) {
                PrintWriter out = response.getWriter();
                out.print("success");

                List<User> userList = userControl.queryByCondition("", "");
                request.setAttribute("userList", userList);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/jsp/user-list.jsp");
                dispatcher.forward(request, response);
            }
        }
    }
}
