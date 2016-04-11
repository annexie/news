package com.xieyan.news.control.impl;

import com.xieyan.news.bean.News;
import com.xieyan.news.control.NewsController;
import com.xieyan.news.dao.NewsDao;
import com.xieyan.news.dao.impl.NewsDaoImpl;

/**
 * Created by xieyan on 16/4/11.
 */
public class NewsControllerImpl implements NewsController {

    @Override
    public boolean addNews(News news) {
        NewsDao newsDao = new NewsDaoImpl();
        return newsDao.addNews(news);
    }
}
