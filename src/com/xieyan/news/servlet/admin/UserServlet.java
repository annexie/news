package com.xieyan.news.servlet.admin;

import com.xieyan.news.bean.Admin;
import com.xieyan.news.bean.User;
import com.xieyan.news.control.UserController;
import com.xieyan.news.control.impl.UserControllerImpl;
import com.xieyan.news.enums.AdminEnum;
import com.xieyan.news.servlet.BaseServlet;
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
//        CheckAdminLoginUtil.CheckAdminLoginUtil(request, response);

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

    /**
     * 添加用户
     */
    public void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //判断管理员是否登录，如果没有登录则会跳转到登陆界面
//        CheckAdminLoginUtil.CheckAdminLoginUtil(request, response);

        //获取返回前端的out
        PrintWriter out = response.getWriter();

        //获取前端传入的用户名和密码
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String valid = request.getParameter("valid");

        //封装为User对象便于传输,默认情况下用户为有效
        User user = new User(username, password, valid);

        UserController userControl = new UserControllerImpl();
        boolean isOk = userControl.register(user);
        if (isOk) {//成功
            out.print("success");
        } else {
            out.print("error");
        }
    }

    public void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //判断管理员是否登录，如果没有登录则会跳转到登陆界面
//        CheckAdminLoginUtil.CheckAdminLoginUtil(request, response);

        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        Admin admin = (Admin) request.getSession().getAttribute("ADMIN_LOGIN");
        int role = admin.getAdminRole();
        if (role == AdminEnum.NORMAL_ADMIN.getCode()) { // 普通管理员没有权限进行修改
            out.write("adminError");
            return;
        } else {

            //获取前台传入的参数
            String id = request.getParameter("id").trim();
            String username = request.getParameter("username").trim();
            String valid = request.getParameter("valid").trim();

            //封装成User对象
            User user = new User(Long.parseLong(id), username, valid);
            //进行更新操作
            UserController userControl = new UserControllerImpl();
            boolean flag = userControl.update(user);

            if (flag) {
                out.write("success");
            } else {
                out.write("error");
            }
        }
    }

    public void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //判断管理员是否登录，如果没有登录则会跳转到登陆界面
//        CheckAdminLoginUtil.CheckAdminLoginUtil(request, response);

        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        Admin admin = (Admin) request.getSession().getAttribute("ADMIN_LOGIN");
        int role = admin.getAdminRole();
        if (role == AdminEnum.NORMAL_ADMIN.getCode() || role == AdminEnum.SENIOR_ADMIN.getCode()) { // 普通管理员没有权限进行修改
            out.write("adminError");
            return;
        } else {
            //获取前台传入的参数
            String id = request.getParameter("id").trim();

            UserController userControl = new UserControllerImpl();
            if (userControl.delete(id)) {
                out.print("success");
            } else {
                out.print("error");
            }
        }
    }
}
