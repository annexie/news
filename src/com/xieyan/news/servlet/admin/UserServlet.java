package com.xieyan.news.servlet.admin;

import com.alibaba.fastjson.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
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

        if ("add".equals(type)) {
            System.out.println(request.getParameter("username"));
            System.out.println(request.getParameter("password"));
            PrintWriter out = response.getWriter();
//            JSONObject jsonObject = new JSONObject();
//            jsonObject.put("result", true);
//            out.print(jsonObject.toString());
            out.print("success");
        } else if ("update".equals(type)) {

        } else if ("delete".equals(type)) {

        }
    }
}
