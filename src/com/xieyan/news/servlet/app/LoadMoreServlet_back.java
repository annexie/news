package com.xieyan.news.servlet.app;

import com.xieyan.news.bean.News;
import com.xieyan.news.control.NewsController;
import com.xieyan.news.control.impl.NewsControllerImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * 加载更多的Servlet
 * Created by xieyan on 16/1/6.
 */
public class LoadMoreServlet_back extends HttpServlet {

    transient static final Logger logger = LoggerFactory.getLogger(LoadMoreServlet_back.class);

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    //version1
//    public void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        PrintWriter out = response.getWriter();
//        response.setCharacterEncoding("utf-8");
//        System.out.println(request.getParameter("startNum"));
//        request.getParameter("startNum");
//
//        NewsController newsController = new NewsControllerImpl();
//        List<News> list = newsController.loadNews(Integer.parseInt(request.getSession().getAttribute("START_NUM") + ""));
//        if (null == list) { //没有数据可以加载
//            out.write("");
//            return;
//        } else {
//            request.getSession().setAttribute("START_NUM", Integer.parseInt(request.getSession().getAttribute("START_NUM") + "") + 5); //重新设置起始记录
//
//            //将news转化为html文件返回
//            String data = new String("");
//            for (News news : list) {
//                data += "<li>\n" +
//                        "    <a class=\"listView-item\">" +
//                        "      <div class=\"listView-img\">" +
//                        "        <img src=\"../image/91.png\">" +
//                        "      </div>" +
//                        "      <div class=\"listView-text\">" +
//                        "         <p class=\"listView-text-title\">" + news.getNewsTitle() + "</p>" +
//                        "         <p class=\"listView-text-subtitle\">" + news.getNewsText().substring(0, 10) + "</p>" +
//                        "         <span class=\"listView-text-tips\">" + news.getDate() + "</span></div>" +
//                        "      </a>\n" +
//                        "</li>";
//            }
//
//            System.out.println(request.toString());
//            out.write(data);
//        }
//    }

    public void nextPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setCharacterEncoding("utf-8");这一行代码要设置在response前边，这样的话还能保证编码正确
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        System.out.println(request.getParameter("startNum"));


        if (null == request.getSession().getAttribute("START_NUM")) { //当没有在session中设置起始记录的时候，进行设置
            request.getSession().setAttribute("START_NUM", 0);
        }

        NewsController newsController = new NewsControllerImpl();
        List<News> list = newsController.loadNews(Integer.parseInt(request.getSession().getAttribute("START_NUM") + ""));
        if (null == list) { //没有数据可以加载
            out.write("");
            return;
        } else {
            request.getSession().setAttribute("START_NUM", Integer.parseInt(request.getSession().getAttribute("START_NUM") + "") + 5); //重新设置起始记录

            //将news转化为html文件返回
            String data = new String("");
            for (News news : list) {
                data += "<li>\n" +
                        "    <a class=\"listView-item\" href=\"http://192.168.1.208:8080/news/jsp/news_detail.jsp?newsId=" + news.getId() + "\">" +
                        "      <div class=\"listView-img\">" +
                        "        <img src=\"http://192.168.1.208:8080/news/image/91.png'\">" +
                        "      </div>" +
                        "      <div class=\"listView-text\">" +
                        "         <p class=\"listView-text-title\">" + news.getNewsTitle() + "</p>" +
                        "         <p class=\"listView-text-subtitle\">" + news.getNewsText().substring(0, 10) + "</p>" +
                        "         <span class=\"listView-text-tips\">" + news.getDate() + "</span></div>" +
                        "      </a>\n" +
                        "</li>";
            }

            System.out.println(request.toString());
            out.write(data);
        }
    }
}


