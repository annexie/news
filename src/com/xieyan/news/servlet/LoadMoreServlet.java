package com.xieyan.news.servlet;

import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by xuliugen on 16/1/6.
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
        String data = "<li data-corners=\"false\" data-shadow=\"false\" data-iconshadow=\"true\" data-wrapperels=\"div\" data-icon=\"arrow-r\" data-iconpos=\"right\" data-theme=\"a\" class=\"ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-li-has-thumb ui-first-child ui-btn-up-a\"><div class=\"ui-btn-inner ui-li\"><div class=\"ui-btn-text\">\n" +
                "<a href=\"http://localhost:8080/jsp/fpmx.html\" class=\"ui-link-inherit\"><img src=\"../images/ic_normal.png\" alt=\"\" class=\"ui-li-thumb\"><h3 class=\"ui-li-heading\">￥5043.00</h3><p class=\"ui-li-desc\">发票代码：<span class=\"text-no\">11155653322</span></p><p class=\"ui-li-desc\">发票号码：<span class=\"text-no\">00001234</span></p>\n" +
                "</a><p class=\"desc-normal ui-li-desc\"><span class=\"left-aside\">开票日期：2013/5/17</span><span class=\"right-aside\">开票员：" + request.getParameter("startNum") + "</span></p></div><span class=\"ui-icon ui-icon-arrow-r ui-icon-shadow\">&nbsp;</span></div></li>\n";
        System.out.println(request.toString());
        out.write(data);
    }
}


