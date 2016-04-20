package com.xieyan.news.dao;

import com.xieyan.news.bean.News;

import java.util.List;

/**
 * Created by xieyan on 16/4/11.
 */
public interface NewsDao {

    boolean addNews(News news);

    List<News> listByCondition(String newsTitle, String newsAuthor, String newsKind);

    boolean update(News news);

    boolean deleteById(long id);

    List<News> loadNews(int startNum);

    int countNews();

    News getNewsById(int newsID);
}
