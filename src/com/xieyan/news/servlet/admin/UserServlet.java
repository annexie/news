package com.xieyan.news.servlet.admin;

import com.xieyan.news.bean.User;
import com.xieyan.news.control.UserController;
import com.xieyan.news.control.impl.UserControllerImpl;
import com.xieyan.news.servlet.BaseServlet;
import com.xieyan.news.utils.CheckAdminLoginUtil;
import com.xieyan.news.utils.PageUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * 后台进行管理User的Servlet
 * Created by xieyan on 16/1/9.
 */
public class UserServlet extends BaseServlet {

    transient static final Logger logger = LoggerFactory.getLogger(UserServlet.class);

    public String list(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //判断管理员是否登录，如果没有登录则会跳转到登陆界面
        CheckAdminLoginUtil.CheckAdminLoginUtil(request, response);

        String username = request.getParameter("username");
        String valid = request.getParameter("valid");

        //先根据条件找到所有符合条件的数据
        UserController userControl = new UserControllerImpl();
        List<User> userCountList = userControl.queryByCondition(username, valid);
        //计算分页的多少，就是有多少页数据
        request.setAttribute("totalPage", PageUtil.getPageCount(userCountList.size()));

        //选择当前页的数据，返回到前台
        String cur = (String) request.getParameter("cur");
        if (null == cur) { //在第一次访问链接的时候，这个参数是没有的，默认设置为1
            cur = "1";
        }
        List<User> userList = userControl.pageByCondition(username, valid, Integer.parseInt(cur));
        request.setAttribute("userList", userList);
        return "/admin/jsp/user-list.jsp";
    }

    public void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //判断管理员是否登录，如果没有登录则会跳转到登陆界面
        CheckAdminLoginUtil.CheckAdminLoginUtil(request, response);

        System.out.println(request.getParameter("username"));
        System.out.println(request.getParameter("password"));
        PrintWriter out = response.getWriter();
        out.print("success");
    }

    public String update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //判断管理员是否登录，如果没有登录则会跳转到登陆界面
        CheckAdminLoginUtil.CheckAdminLoginUtil(request, response);

        //获取前台传入的参数
        String id = request.getParameter("id").trim();
        String username = request.getParameter("username").trim();
        String valid = request.getParameter("valid").trim();

        //封装成User对象
        User user = new User(Long.parseLong(id), username, valid);
        //进行更新操作
        UserController userControl = new UserControllerImpl();
        userControl.update(user);

        //返回前端新的用户列表信息
        List<User> userList = userControl.queryByCondition("", "");
        request.setAttribute("userList", userList);

        //返回前台成功消息
        request.setAttribute("updateFlag", true);

        return "/admin/jsp/user-list.jsp";
    }

    public String delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //判断管理员是否登录，如果没有登录则会跳转到登陆界面
        CheckAdminLoginUtil.CheckAdminLoginUtil(request, response);

        //获取前台传入的参数
        String id = request.getParameter("id").trim();

        UserController userControl = new UserControllerImpl();
        if (userControl.delete(id)) {
            PrintWriter out = response.getWriter();
            out.print("success");

            List<User> userList = userControl.queryByCondition("", "");
            request.setAttribute("userList", userList);
        }
        return "/admin/jsp/user-list.jsp";
    }
}
