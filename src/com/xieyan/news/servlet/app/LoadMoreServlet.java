package com.xieyan.news.servlet.app;

import com.xieyan.news.bean.News;
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
public class LoadMoreServlet extends BaseServlet {

    transient static final Logger logger = LoggerFactory.getLogger(LoadMoreServlet.class);

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

//    public void proPage(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setCharacterEncoding("utf-8");
//        PrintWriter out = response.getWriter();
//
//        NewsController newsController = new NewsControllerImpl();
//
//        request.setAttribute("pageStart", Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT") + ""));
//
//
//        int start = Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT") + "");
//        if (start < 0) {
//            out.write("");
//            return;
//        }
//        //获取所有的新闻条数
//        int count = newsController.countNews();
//        List<News> list = new ArrayList<News>(5);
//        if (start + 5 > count) { //是最后一页的数据
//            list = newsController.loadNews(start - 5);
//            request.getSession().setAttribute("LOAD_COUNT", Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT") + "") - 10); //重新设置起始记录
//        } else {
//            list = newsController.loadNews(start);
//        }
//        if (null == list) { //没有数据可以加载
//            out.write("");
//            return;
//        } else {
//            request.getSession().setAttribute("LOAD_COUNT", Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT") + "") - 5); //重新设置起始记录
//
//            request.setAttribute("newsList", list);
//
//            request.setAttribute("countNum", count);
//            out.write("success");
//            request.getRequestDispatcher("/news/jsp/news-list.jsp").forward(request, response);
//        }
//    }

//    public void firstLoad(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setCharacterEncoding("utf-8");
//        PrintWriter out = response.getWriter();
//
//        if (null == request.getSession().getAttribute("LOAD_COUNT")) { //当没有在session中设置起始记录的时候，进行设置，也是第一次执行时进行加载的方法
//            request.getSession().setAttribute("LOAD_COUNT", 0);
//            NewsController newsController = new NewsControllerImpl();
//
//            //获取所有的新闻条数
//            int count = newsController.countNews();
//            List<News> list = newsController.loadNews(0);
//            if (null == list) { //没有数据可以加载
//                out.write("");
//                return;
//            } else {
//                request.getSession().setAttribute("LOAD_COUNT", Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT") + "") + 5); //重新设置起始记录
//
//                request.setAttribute("newsList", list);
//                request.setAttribute("pageStart", Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT") + ""));
//                request.setAttribute("countNum", count);
//                out.write("success");
//                request.getRequestDispatcher("/news/jsp/news-list.jsp").forward(request, response);
//            }
//        } else {
//            return;
//        }
//    }

}


