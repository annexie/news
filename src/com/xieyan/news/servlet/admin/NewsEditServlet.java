package com.xieyan.news.servlet.admin;

import com.xieyan.news.bean.News;
import com.xieyan.news.control.NewsController;
import com.xieyan.news.control.impl.NewsControllerImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * 信息编辑的Servlet
 * Created by xieyan on 16/1/9.
 */
public class NewsEditServlet extends HttpServlet {

    transient static final Logger logger = LoggerFactory.getLogger(NewsEditServlet.class);

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String type = request.getParameter("type");
        NewsController newsController = new NewsControllerImpl();
        if ("list".equals(type)) { //列举新闻信息,包含新闻的搜索
            String newsTitle = request.getParameter("newsTitle");
            String newsAuthor = request.getParameter("newsAuthor");
            String newsKind = request.getParameter("newsKind");

            List<News> userList = newsController.queryByCondition(newsTitle, newsAuthor, newsKind);
            request.setAttribute("newsList", userList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/jsp/news-list.jsp");
            dispatcher.forward(request, response);
        } else if ("add".equals(type)) {  //添加新闻
            News news = assemberNews(request);
            boolean flag = newsController.addNews(news);
        } else if ("update".equals(type)) { //修改新闻
            //获取前台传入的参数
            String id = request.getParameter("id");
            String newsTitle = request.getParameter("newsTitle");
            String newsAuthor = request.getParameter("newsAuthor");
            String newsKind = request.getParameter("newsKind");

            //封装成News对象
            News news = new News(Long.parseLong(id), newsTitle, newsAuthor, newsKind);
            //进行更新操作
            newsController.update(news);


        } else if ("delete".equals(type)) {//删除新闻
            String id = request.getParameter("id").trim();
            boolean flag = newsController.deleteById(Long.parseLong(id));
        }

    }

    /**
     * 根据request组装请求参数中的News
     * @param request 请求参数
     * @return News对象
     */
    private News assemberNews(HttpServletRequest request) {
        String newsTitle = request.getParameter("newsTitle");
        String id = request.getParameter("id");
        String newsKind = request.getParameter("newsKind");
        String newsAuthor = request.getParameter("newsAuthor");
        String newText = request.getParameter("newText");

        News news = new News();
        news.setNewsTitle(newsTitle);
        news.setNewsText(newText);
        news.setNewsAuthor(newsAuthor);
        news.setNewsKind(newsKind);
        news.setValid(1);
        news.setNewsOriginType("1");
        news.setNewsText(newText);
        news.setDate(new Date());
        return news;
    }
}
