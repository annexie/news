//package com.xieyan.news.utils;
//
//import com.xieyan.news.bean.Admin;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
///**
// * Created by xieyan on 2016/4/14.
// */
//public class CheckAdminLoginUtil {
//
//    public static void CheckAdminLoginUtil(HttpServletRequest request, HttpServletResponse response) {
//
//        Admin admin = (Admin) request.getSession().getAttribute("ADMIN_LOGIN");
//        if (null == admin) {
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/jsp/admin-login.jsp");
//            try {
//                dispatcher.forward(request, response);
//                return;
//            } catch (ServletException e) {
//                e.printStackTrace();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//    }
//}
