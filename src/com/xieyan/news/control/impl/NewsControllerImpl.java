package com.xieyan.news.control.impl;

import com.xieyan.news.bean.News;
import com.xieyan.news.bean.NewsCollection;
import com.xieyan.news.control.NewsController;
import com.xieyan.news.dao.NewsDao;
import com.xieyan.news.dao.impl.NewsDaoImpl;

import java.util.List;

/**
 * Created by xieyan on 16/4/11.
 */
public class NewsControllerImpl implements NewsController {

    @Override
    public boolean addNews(News news) {
        NewsDao newsDao = new NewsDaoImpl();
        return newsDao.addNews(news);
    }

    @Override
    public List<News> queryByCondition(String newsTitle, String newsAuthor, String newsKind) {
        NewsDao newsDao = new NewsDaoImpl();
        return newsDao.listByCondition(newsTitle, newsAuthor, newsKind);
    }

    @Override
    public boolean update(News news) {
        NewsDao newsDao = new NewsDaoImpl();
        return newsDao.update(news);
    }

    @Override
    public boolean deleteById(long id) {
        NewsDao newsDao = new NewsDaoImpl();
        return newsDao.deleteById(id);
    }

    @Override
    public List<News> loadNews(int loadCount, Long newsKind) {
        NewsDao newsDao = new NewsDaoImpl();
        return newsDao.loadNews(loadCount, newsKind);
    }

    @Override
    public int countNews(Long newsKind) {
        NewsDao newsDao = new NewsDaoImpl();
        return newsDao.countNews(newsKind);
    }

    @Override
    public News getNewsById(int newsID) {
        NewsDao newsDao = new NewsDaoImpl();
        return newsDao.getNewsById(newsID);
    }

    @Override
    public boolean newsCollection(int newsId, Long userId, String newTitle) {
        NewsDao newsDao = new NewsDaoImpl();
        return newsDao.newsCollection(newsId, userId, newTitle);
    }

    @Override
    public List<NewsCollection> listCollection(int userId) {
        NewsDao newsDao = new NewsDaoImpl();
        return newsDao.listCollection(userId);
    }
}
