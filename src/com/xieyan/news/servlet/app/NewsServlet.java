package com.xieyan.news.servlet.app;

import com.xieyan.news.bean.News;
import com.xieyan.news.bean.NewsCollection;
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
import java.util.ArrayList;
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

        Long newsKind = Long.parseLong(request.getParameter("newsKind"));
        if (null == newsKind || "".equals(newsKind)) {
            newsKind = 1L; //设置默认的新闻类别为1：科技
        }
        System.out.println("newsKind----" + newsKind);
        if (newsKind == 3L) { //人文信息
            if (null == request.getSession().getAttribute("LOAD_COUNT_RW")) { //当没有在session中设置起始记录的时候，进行设置
                request.getSession().setAttribute("LOAD_COUNT_RW", 5);
            }

            NewsController newsController = new NewsControllerImpl();
            int loadCount = Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT_RW") + "");
            System.out.println("loadCount----" + loadCount);
            if (loadCount < 0) {
                out.write("");
                return;
            }
            //获取所有的新闻条数
            int count = newsController.countNews(newsKind);
            List<News> list = newsController.loadNews(loadCount, newsKind);
            if (null == list) { //没有数据可以加载
                out.write("");
                return;
            } else {
                if (loadCount + 5 < count) { //当还没有到最后一个的数据
                    request.getSession().setAttribute("LOAD_COUNT_RW", Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT_RW") + "") + 5); //重新设置起始记录
                } else { //当时最后一页的时候
                    request.getSession().setAttribute("LOAD_COUNT_RW", count);
                }

                request.setAttribute("newsList", list);
                request.setAttribute("pageStart", Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT_RW") + ""));
                request.getSession().setAttribute("countNum", count);
                out.write("success");
                request.getRequestDispatcher("/news/jsp/news-list-rw.jsp").forward(request, response);
            }
        } else if (newsKind == 2L) { //计算机信息信息

            if (null == request.getSession().getAttribute("LOAD_COUNT_JSJ")) { //当没有在session中设置起始记录的时候，进行设置
                request.getSession().setAttribute("LOAD_COUNT_JSJ", 5);
            }

            NewsController newsController = new NewsControllerImpl();
            int loadCount = Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT_JSJ") + "");
            System.out.println("loadCount----" + loadCount);
            if (loadCount < 0) {
                out.write("");
                return;
            }
            //获取所有的新闻条数
            int count = newsController.countNews(newsKind);
            List<News> list = newsController.loadNews(loadCount, newsKind);
            if (null == list) { //没有数据可以加载
                out.write("");
                return;
            } else {
                if (loadCount + 5 < count) { //当还没有到最后一个的数据
                    request.getSession().setAttribute("LOAD_COUNT_JSJ", Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT_JSJ") + "") + 5); //重新设置起始记录
                } else { //当时最后一页的时候
                    request.getSession().setAttribute("LOAD_COUNT_JSJ", count);
                }

                request.setAttribute("newsList", list);
                request.setAttribute("pageStart", Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT_JSJ") + ""));
                request.getSession().setAttribute("countNum", count);
                out.write("success");
                request.getRequestDispatcher("/news/jsp/news-list-jsj.jsp").forward(request, response);
            }
        } else if (newsKind == 1L) { //科技信息
            if (null == request.getSession().getAttribute("LOAD_COUNT_KJ")) { //当没有在session中设置起始记录的时候，进行设置
                request.getSession().setAttribute("LOAD_COUNT_KJ", 5);
            }

            NewsController newsController = new NewsControllerImpl();
            int loadCount = Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT_KJ") + "");
            System.out.println("loadCount----" + loadCount);
            if (loadCount < 0) {
                out.write("");
                return;
            }
            //获取所有的新闻条数
            int count = newsController.countNews(newsKind);
            List<News> list = newsController.loadNews(loadCount, newsKind);
            if (null == list) { //没有数据可以加载
                out.write("");
                return;
            } else {
                if (loadCount + 5 < count) { //当还没有到最后一个的数据
                    request.getSession().setAttribute("LOAD_COUNT_KJ", Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT_KJ") + "") + 5); //重新设置起始记录
                } else { //当时最后一页的时候
                    request.getSession().setAttribute("LOAD_COUNT_KJ", count);
                }

                request.setAttribute("newsList", list);
                request.setAttribute("pageStart", Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT_KJ") + ""));
                request.getSession().setAttribute("countNum", count);
                out.write("success");
                request.getRequestDispatcher("/news/jsp/news-list.jsp").forward(request, response);
            }
        }
    }

    public void newsBack(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        String newsKind = request.getParameter("newsKind");
        if (null == newsKind || "".equals(newsKind)) {
            newsKind = "1"; //设置默认的新闻类别为1：科技
        }
        NewsController newsController = new NewsControllerImpl();
        if (newsKind.equals("3")) {
            int loadCount = 0;
            if (null == request.getSession().getAttribute("LOAD_COUNT_RW")) {
                loadCount = 5;
            } else {
                loadCount = Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT_RW") + "");
            }

            System.out.println("LOAD_COUNT_RW----" + loadCount);
            if (loadCount < 0) {
                out.write("");
                return;
            }
            //获取所有的新闻条数
            int count = newsController.countNews(Long.parseLong(newsKind));
            List<News> list = new ArrayList<News>();
            if (loadCount <= count) { //即出现session被减到负值时
                list = newsController.loadNews(count, Long.parseLong(newsKind));
            } else {
                list = newsController.loadNews(loadCount - 5, Long.parseLong(newsKind)); //因为在点击loadNextPage下一页的时候session中存放的LOAD_COUNT已经被加5操作了
            }
            if (null == list) { //没有数据可以加载
                out.write("");
                return;
            } else {
                request.setAttribute("newsList", list);
                request.getSession().setAttribute("countNum", count);
                request.getRequestDispatcher("/news/jsp/news-list-rw.jsp").forward(request, response);
            }
        } else if (newsKind.equals("2")) {
//            int loadCount = Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT_JSJ") + "");

            int loadCount = 0;
            if (null == request.getSession().getAttribute("LOAD_COUNT_JSJ")) {
                loadCount = 5;
            } else {
                loadCount = Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT_JSJ") + "");
            }

            System.out.println("LOAD_COUNT_JSJ----" + loadCount);
            if (loadCount < 0) {
                out.write("");
                return;
            }
            //获取所有的新闻条数
            int count = newsController.countNews(Long.parseLong(newsKind));
            List<News> list = new ArrayList<News>();
            if (loadCount <= count) { //即出现session被减到负值时
                list = newsController.loadNews(count, Long.parseLong(newsKind));
            } else {
                list = newsController.loadNews(loadCount - 5, Long.parseLong(newsKind)); //因为在点击loadNextPage下一页的时候session中存放的LOAD_COUNT已经被加5操作了
            }
            if (null == list) { //没有数据可以加载
                out.write("");
                return;
            } else {
                request.setAttribute("newsList", list);
                request.getSession().setAttribute("countNum", count);
                request.getRequestDispatcher("/news/jsp/news-list-jsj.jsp").forward(request, response);
            }
        } else if (newsKind.equals("1")) {
            int loadCount = 0;
            if (null == request.getSession().getAttribute("LOAD_COUNT_KJ")) {
                loadCount = 5;
            } else {
                loadCount = Integer.parseInt(request.getSession().getAttribute("LOAD_COUNT_KJ") + "");
            }
            System.out.println("LOAD_COUNT_KJ----" + loadCount);
            if (loadCount < 0) {
                out.write("");
                return;
            }
            //获取所有的新闻条数
            int count = newsController.countNews(Long.parseLong(newsKind));
            List<News> list = new ArrayList<News>();
            if (loadCount <= count) { //即出现session被减到负值时
                list = newsController.loadNews(count, Long.parseLong(newsKind));
            } else {
                list = newsController.loadNews(loadCount - 5, Long.parseLong(newsKind)); //因为在点击loadNextPage下一页的时候session中存放的LOAD_COUNT已经被加5操作了
            }
            if (null == list) { //没有数据可以加载
                out.write("");
                return;
            } else {
                request.setAttribute("newsList", list);
                request.getSession().setAttribute("countNum", count);
                request.getRequestDispatcher("/news/jsp/news-list.jsp").forward(request, response);
            }
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

    /**
     * 列举用户收藏的新闻
     */
    public void listCollection(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();//获取输出对象

        int userId = Integer.parseInt(request.getParameter("userId"));//把字符串类型强转为Int
        NewsController newsController = new NewsControllerImpl();
        User user = (User) request.getSession().getAttribute("CLIENT_USER");

        //判断用户是否登录，如果没有登录的话要进行登录,提示用户进行登录之后操作
        if (null == user) {
            out.write("loginError");//后台返回给前台
            return;
        }

        List<NewsCollection> newsList = newsController.listCollection(userId);

        request.setAttribute("newsCollectionList", newsList);
        request.getRequestDispatcher("/news/jsp/user-collection.jsp").forward(request, response);
    }
}


