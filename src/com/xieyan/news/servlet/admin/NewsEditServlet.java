package com.xieyan.news.servlet.admin;

import com.xieyan.news.bean.News;
import com.xieyan.news.control.NewsController;
import com.xieyan.news.control.impl.NewsControllerImpl;

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

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String type = request.getParameter("type");
        if ("list".equals(type)) { //列举用户信息,包含用户的搜索
            String newsTitle = request.getParameter("newsTitle");
            String newsAuthor = request.getParameter("newsAuthor");
            String newsKind = request.getParameter("newsKind");

            NewsController newsController = new NewsControllerImpl();
            List<News> userList = newsController.queryByCondition(newsTitle, newsAuthor, newsKind);
            request.setAttribute("newsList", userList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/jsp/news-list.jsp");
            dispatcher.forward(request, response);
        } else if ("add".equals(type)) {  //添加用户
            News news = assemberNews(request);
            NewsController newsController = new NewsControllerImpl();
            boolean flag = newsController.addNews(news);
            if (flag) {
                //重新读取新闻列表然后跳转到新闻列表界面进行展示
                request.setAttribute("newsList", null);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/jsp/user-list.jsp");
                dispatcher.forward(request, response);
            }
        } else if ("update".equals(type)) { //修改用户

        } else if ("delete".equals(type)) {//删除用户

        }

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
