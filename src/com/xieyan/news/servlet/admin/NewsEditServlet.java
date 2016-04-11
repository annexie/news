package com.xieyan.news.servlet.admin;

import com.xieyan.news.bean.News;
import com.xieyan.news.control.NewsController;
import com.xieyan.news.control.impl.NewsControllerImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * 信息编辑的Servlet
 * Created by xieyan on 16/1/9.
 */
public class NewsEditServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        News news = assemberNews(request);
        NewsController newsController = new NewsControllerImpl();
        boolean falg = newsController.addNews(news);

    }

    /**
     * 根据request组装请求参数中的News
     * @param request 请求参数
     * @return News对象
     */
    private News assemberNews(HttpServletRequest request) {
        String newsTitle = request.getParameter("newsTitle");
        String newsKind = request.getParameter("newsKind");
        String newsAuthor = request.getParameter("newsAuthor");
        String newText = request.getParameter("newText");

        News news = new News();
        news.setNewsText(newsTitle);
        news.setNewsAuthor(newsAuthor);
        news.setNewsKind(newsKind);
        news.setValid(1);
        news.setNewsText(newText);
        news.setDate(new Date());
        return news;
    }
}
