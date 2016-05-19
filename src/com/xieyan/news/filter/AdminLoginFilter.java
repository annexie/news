package com.xieyan.news.filter;


import com.xieyan.news.bean.Admin;
import com.xieyan.news.costant.AdminConstant;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 判断管理员是否登录的过滤器
 * Created by xuliugen on 16/5/19.
 */
public class AdminLoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {
        //获取request/response对象
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        //获取session对象
        HttpSession httpSession = request.getSession();

        //读取缓存中存放的admin
        Admin admin = (Admin) httpSession.getAttribute(AdminConstant.ADMIN_LOGIN);
        if (null == admin) { //未登录
            String requstUrl = request.getServletPath(); //获取请求的url地址
            String type = request.getParameter("type"); //获取请求的方法
            if (!(AdminConstant.BACK_ADMIN_LOGIN.equals(requstUrl) && type.equals("login"))) { //不是后台管理登陆的请求,就是没有真正的登录
                RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/jsp/admin-login.jsp");
                try {
                    dispatcher.forward(request, response);
                    return;
                } catch (ServletException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        filterChain.doFilter(req, resp);
    }

    @Override
    public void destroy() {

    }
}
