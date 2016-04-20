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

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        String type = request.getParameter("type");

        if (null == request.getSession().getAttribute("START_NUM")) { //当没有在session中设置起始记录的时候，进行设置
            request.getSession().setAttribute("START_NUM", 0);
        }

        NewsController newsController = new NewsControllerImpl();
        int start = Integer.parseInt(request.getSession().getAttribute("START_NUM") + "");
        if (start < 0) {
            out.write("");
            return;
        }
        //获取所有的新闻条数
        int count = newsController.countNews();
        List<News> list = newsController.loadNews(start);
        if (null == list) { //没有数据可以加载
            out.write("");
            return;
        } else {
            if ("nextPage".equals(type)) { //下一页
                request.getSession().setAttribute("START_NUM", Integer.parseInt(request.getSession().getAttribute("START_NUM") + "") + 5); //重新设置起始记录
            } else if ("proPage".equals(type)) { //上一页
                request.getSession().setAttribute("START_NUM", Integer.parseInt(request.getSession().getAttribute("START_NUM") + "") - 5); //重新设置起始记录
            } else if ("firstLoad".equals(type)) { //第一次加载

            }

            request.setAttribute("newsList", list);
            request.setAttribute("pageStart", Integer.parseInt(request.getSession().getAttribute("START_NUM") + ""));
            request.setAttribute("countNum", count);
            out.write("success");
            request.getRequestDispatcher("/news/jsp/news-list.jsp").forward(request, response);
        }
    }
}


