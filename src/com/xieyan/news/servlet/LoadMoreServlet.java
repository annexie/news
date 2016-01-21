package com.xieyan.news.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

/**
 * Created by xieyan on 16/1/6.
 */
public class LoadMoreServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        System.out.println(request.getParameter("startNum"));
        String data = "<li>\n" +
                "                        <a class=\"listView-item\">\n" +
                "                            <div class=\"listView-img\"><img src=\"../image/91.png\"></div>\n" +
                "                            <div class=\"listView-text\">\n" +
                "                                <p class=\"listView-text-title\">apicloud云端一体</p>\n" +
                "\n" +
                "                                <p class=\"listView-text-subtitle\">\n" +
                "                                    apicloud重新定义移动应用开发\n" +
                "                                </p>\n" +
                "                                <span class=\"listView-text-tips\">" + new Date() + "</span></div>\n" +
                "                        </a>\n" +
                "                    </li>";
        System.out.println(request.toString());
        out.write(data);

    }
}


