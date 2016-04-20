package com.xieyan.news.control;

import com.xieyan.news.bean.News;

import java.util.List;

/**
 * Created by xieyan on 16/4/11.
 */
public interface NewsController {

    boolean addNews(News news);

    List<News> queryByCondition(String newsTitle, String newsAuthor, String newsKind);

    boolean update(News news);

    boolean deleteById(long id);

    List<News> loadNews(int startNum);

    int countNews();
}
