package com.xieyan.news.control;

import com.xieyan.news.bean.News;
import com.xieyan.news.bean.NewsCollection;

import java.util.List;

/**
 * Created by xieyan on 16/4/11.
 */
public interface NewsController {

    boolean addNews(News news);

    List<News> queryByCondition(String newsTitle, String newsAuthor, String newsKind);

    boolean update(News news);

    boolean deleteById(long id);

    List<News> loadNews(int startNum,Long newsKind);

    int countNews(Long newsKind);

    News getNewsById(int newsID);

    boolean newsCollection(int newsId, Long userId, String newTitle);

    List<NewsCollection> listCollection(int userId);
}
