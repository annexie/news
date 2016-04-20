package com.xieyan.news.servlet.app;

import com.xieyan.news.bean.News;
import com.xieyan.news.bean.User;
import com.xieyan.news.control.NewsController;
import com.xieyan.news.control.impl.NewsControllerImpl;
import com.xieyan.news.servlet.BaseServlet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * 加载更多的Servlet
 * Created by xieyan on 16/1/6.
 */
public class NewsServlet extends BaseServlet {

    transient static final Logger logger = LoggerFactory.getLogger(NewsServlet.class);

    /**
     * 下一页的功能就是加载更多的数据
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void nextPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        if (null == request.getSession().getAttribute("LOAD_COUNT")) { //当没有在session中设置起始记录的时候，进行设置
            request.getSession().setAttribute("LOAD_COUNT", 5);
        }

        NewsController newsController = new NewsControllerImpl();
        int loadCount = Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT") + "");
        if (loadCount < 0) {
            out.write("");
            return;
        }
        //获取所有的新闻条数
        int count = newsController.countNews();
        List<News> list = newsController.loadNews(loadCount);
        if (null == list) { //没有数据可以加载
            out.write("");
            return;
        } else {
            if (loadCount + 5 < count) { //当还没有到最后一个的数据
                request.getSession().setAttribute("LOAD_COUNT", Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT") + "") + 5); //重新设置起始记录
            } else { //当时最后一页的时候
                request.getSession().setAttribute("LOAD_COUNT", count);
            }

            request.setAttribute("newsList", list);
            request.setAttribute("pageStart", Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT") + ""));
            request.setAttribute("countNum", count);
            out.write("success");
            request.getRequestDispatcher("/news/jsp/news-list.jsp").forward(request, response);
        }
    }

    public void newsBack(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        NewsController newsController = new NewsControllerImpl();
        int loadCount = Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT") + "");
        if (loadCount < 0) {
            out.write("");
            return;
        }
        //获取所有的新闻条数
        int count = newsController.countNews();
        List<News> list = newsController.loadNews(loadCount - 5); //因为在点击loadNextPage下一页的时候session中存放的LOAD_COUNT已经被加5操作了
        if (null == list) { //没有数据可以加载
            out.write("");
            return;
        } else {
            request.setAttribute("newsList", list);
            request.setAttribute("pageStart", Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT") + ""));
            request.setAttribute("countNum", count);
            out.write("success");
            request.getRequestDispatcher("/news/jsp/news-list.jsp").forward(request, response);
        }
    }

    /**
     * 新闻的详细信息展示
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void newsDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setCharacterEncoding("utf-8");
        int newsId = Integer.parseInt(request.getParameter("newsId"));
        NewsController newsController = new NewsControllerImpl();
        News news = newsController.getNewsById(newsId);
        request.setAttribute("newsDetail", news);
        request.getRequestDispatcher("/news/jsp/news-detail.jsp").forward(request, response);
    }

    public void newsColle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        int newsId = Integer.parseInt(request.getParameter("newsID"));
        String newTitle = request.getParameter("newsTitle");
        NewsController newsController = new NewsControllerImpl();
        User user = (User) request.getSession().getAttribute("CLIENT_USER");

        //判断用户是否登录，如果没有登录的话要进行登录,提示用户进行登录之后操作
        if (null == user) {
            out.write("loginError");
            return;
        }

        boolean falg = newsController.newsCollection(newsId, user.getId(), newTitle);
        if (falg) {
            out.write("success");
        } else {
            out.write("failed");
        }
    }
}


