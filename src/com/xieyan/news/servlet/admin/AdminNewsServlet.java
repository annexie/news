package com.xieyan.news.servlet.admin;

import com.xieyan.news.bean.News;
import com.xieyan.news.control.NewsController;
import com.xieyan.news.control.impl.NewsControllerImpl;
import com.xieyan.news.servlet.BaseServlet;
import com.xieyan.news.utils.CheckAdminLoginUtil;
import com.xieyan.news.utils.PageUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * 信息编辑的Servlet
 * Created by xieyan on 16/1/9.
 */
public class AdminNewsServlet extends BaseServlet {

    transient static final Logger logger = LoggerFactory.getLogger(AdminNewsServlet.class);

    public String list(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //判断管理员是否登录，如果没有登录则会跳转到登陆界面
        CheckAdminLoginUtil.CheckAdminLoginUtil(request, response);

        NewsController newsController = new NewsControllerImpl();
        String newsTitle = request.getParameter("newsTitle");
        String newsAuthor = request.getParameter("newsAuthor");
        String newsKind = request.getParameter("newsKind");

        //根据查询条件到数据库中查找符合条件的全部数据，去计算页数
        List<News> userList = newsController.queryByCondition(newsTitle, newsAuthor, newsKind);
        //计算分页的多少，就是有多少页数据
        request.setAttribute("totalPage", PageUtil.getPageCount(userList.size()));

        //选择当前页的数据，返回到前台
        String cur = (String) request.getParameter("cur");
        if (null == cur) { //在第一次访问链接的时候，这个参数是没有的，默认设置为1
            cur = "1";
        }

        //去进行分页查询
        List<News> resultList = newsController.pageByCondition(newsTitle, newsAuthor, newsKind, Integer.parseInt(cur));
        request.setAttribute("newsList", resultList);

        return "/admin/jsp/news-list.jsp";
    }


    public void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //判断管理员是否登录，如果没有登录则会跳转到登陆界面
        CheckAdminLoginUtil.CheckAdminLoginUtil(request, response);

        NewsController newsController = new NewsControllerImpl();
        News news = assemberNews(request);
        boolean flag = newsController.addNews(news);
    }

    public void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //判断管理员是否登录，如果没有登录则会跳转到登陆界面
        CheckAdminLoginUtil.CheckAdminLoginUtil(request, response);

        NewsController newsController = new NewsControllerImpl();
        String id = request.getParameter("id").trim();
        boolean flag = newsController.deleteById(Long.parseLong(id));

    }

    public void udpate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //判断管理员是否登录，如果没有登录则会跳转到登陆界面
        CheckAdminLoginUtil.CheckAdminLoginUtil(request, response);

        //获取前台传入的参数
        String id = request.getParameter("id");
        String newsTitle = request.getParameter("newsTitle");
        String newsAuthor = request.getParameter("newsAuthor");
        String newsKind = request.getParameter("newsKind");

        //封装成News对象
        News news = new News(Long.parseLong(id), newsTitle, newsAuthor, newsKind);
        NewsController newsController = new NewsControllerImpl();
        //进行更新操作
        newsController.update(news);
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
