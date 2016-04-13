package com.xieyan.news.dao.impl;

import com.xieyan.news.bean.News;
import com.xieyan.news.dao.NewsDao;
import com.xieyan.news.utils.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by xieayn on 16/4/11.
 */
public class NewsDaoImpl implements NewsDao {

    @Override
    public boolean addNews(News news) {
        Connection connection = DBUtil.getConn();
        String sql = "insert into news_list(`news_title`, `news_author`, `news_text`, `news_url`, `origin_type`,`date`,`update_date`, `valid`, `image_url`, `news_kind`) values (?,?,?,?,?,?,?,?,?,?)";// 编写sql语句，第一个字段不需要插入，是自动增加的
        PreparedStatement preparedStatement = null;
        boolean flag = false;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, news.getNewsTitle() + "");
            preparedStatement.setString(2, news.getNewsAuthor() + "");
            preparedStatement.setString(3, news.getNewsText() + "");
            preparedStatement.setString(4, news.getNewsUrl() + "");
            preparedStatement.setString(5, news.getNewsOriginType());
            preparedStatement.setDate(6, new Date(System.currentTimeMillis()));
            preparedStatement.setDate(7, new Date(System.currentTimeMillis()));
            preparedStatement.setInt(8, news.getValid());
            preparedStatement.setString(9, news.getNewImageUrl());
            preparedStatement.setString(10, news.getNewsKind());
            int isOk = preparedStatement.executeUpdate(); //执行executeUpdate()方法:这里是update数据相当于更新、插入
            if (isOk > 0) {
                return !flag;
            } else {
                return flag;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DBUtil.close(connection, null, preparedStatement, null);
        return flag;
    }

    @Override
    public List<News> listByCondition(String newsTitle, String newsAuthor, String newsKind) {
        Connection connection = DBUtil.getConn();
        String sql = getSqlUrl(newsTitle, newsAuthor, newsKind);
        PreparedStatement preparedStatement = null;
        List<News> newsList = new ArrayList<News>();
        try {
            preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                News news = new News();
                news.setId(rs.getLong("id"));
                news.setNewsTitle(rs.getString("news_title"));
                news.setNewsAuthor(rs.getString("news_author"));
                news.setNewsKind(rs.getString("news_kind"));
                news.setNewsText(rs.getString("news_text"));
                news.setDate(rs.getDate("date"));
                news.setValid(rs.getInt("valid"));
                news.setNewsUrl(rs.getString("image_url"));
                newsList.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DBUtil.close(connection, null, preparedStatement, null);
        return newsList;
    }

    @Override
    public boolean update(News news) {
        Connection connection = DBUtil.getConn();
        String sql = "update news_list set news_title = ? , news_author =? , news_kind =? where id =?";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, news.getNewsTitle() + "");
            preparedStatement.setString(2, news.getNewsAuthor() + "");
            preparedStatement.setString(3, news.getNewsKind());
            preparedStatement.setLong(4, news.getId());
            int flag = preparedStatement.executeUpdate();
            if (flag == 1) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, preparedStatement, null);
        }
        return false;
    }

    @Override
    public boolean deleteById(long id) {
        Connection connection = DBUtil.getConn();
        String sql = "delete from news_list where id = ?";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, id);
            boolean flag = preparedStatement.execute();
            if (flag) {
                return true;
            }
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, preparedStatement, null);
        }
        return false;
    }

    /**
     * 根据查询的条件构造sql语句
     * @param newsTitle
     * @param newsAuthor
     * @param newsKind
     * @return
     */
    private String getSqlUrl(String newsTitle, String newsAuthor, String newsKind) {
        String sql = new String("select * from news_list where 1=1 ");
        if (null != newsTitle && (!"".equals(newsTitle))) {
            sql += "and news_title = '" + newsTitle + "'";
        }
        if (null != newsAuthor && (!"".equals(newsAuthor))) {
            sql += "and news_author = '" + newsAuthor + "'";
        }
        if (null != newsKind && (!"".equals(newsKind))) {
            sql += "and news_kind = '" + newsKind + "'";
        }
        return sql;
    }
}
