package com.xieyan.news.dao.impl;

import com.xieyan.news.bean.News;
import com.xieyan.news.bean.NewsCollection;
import com.xieyan.news.dao.NewsDao;
import com.xieyan.news.utils.JdbcUtils;
import com.xieyan.news.utils.PageUtil;
import com.xieyan.news.utils.TxQueryRunner;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.*;
import java.util.List;

/**
 * Created by xieayn on 16/4/11.
 */
public class NewsDaoImpl implements NewsDao {

    @Override
    public boolean addNews(News news) {

        Connection connection = null;
        try {
            connection = JdbcUtils.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String sql = "insert into news_list(`newsTitle`, `newsAuthor`, `newsText`, `newsUrl`, `originType`, `valid`, `imageUrl`, `newsKind`) values (?,?,?,?,?,?,?,?)";// 编写sql语句，第一个字段不需要插入，是自动增加的
        PreparedStatement ps = null;
        boolean flag = false;
        try {
            ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, news.getNewsTitle() + "");
            ps.setString(2, news.getNewsAuthor() + "");
            ps.setString(3, news.getNewsText() + "");
            ps.setString(4, news.getNewsUrl() + "");
            ps.setString(5, news.getOriginType());
            ps.setInt(6, news.getValid());
            ps.setString(7, news.getImageUrl());
            ps.setString(8, news.getNewsKind());
            int isOk = ps.executeUpdate(); //执行executeUpdate()方法:这里是update数据相当于更新、插入

            if (isOk > 0) { //news插入成功

                //插入成功之后返回获取到的id
                ResultSet rs = ps.getGeneratedKeys();
                rs.next();
                Long geneNewsId = rs.getLong(1);
                flag = insertNewsKind(geneNewsId, news.getNewsKind(), connection);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                JdbcUtils.releaseConnection(connection);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return flag;
    }

    /**
     * 当新闻信息插入成功之后将信息再次插入到news_kind表中
     * @param geneNewsId news插入成功之后获取的id
     * @param connection connection链接
     * @return 是否成功
     */
    private boolean insertNewsKind(Long geneNewsId, String newsKind, Connection connection) {

        String sql = "insert into news_kinds_list(`newsKinds`,`newsId`) values (?,?)";
        QueryRunner qr = new TxQueryRunner();
        try {

            //执行的参数
            Object[] params = {newsKind, geneNewsId};

            int isOk = qr.update(sql, params);

            return isOk > 0 ? true : false;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                JdbcUtils.releaseConnection(connection);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public List<News> listByCondition(String newsTitle, String newsAuthor, String newsKind) {

        String sql = getSqlUrl(newsTitle, newsAuthor, newsKind);
        QueryRunner qr = new TxQueryRunner();
        List<News> result = null;
        try {
            result = qr.query(sql, new BeanListHandler<News>(News.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(result.toString());
        if (null != result) {
            return result;
        } else {
            return null;
        }
    }

    @Override
    public boolean update(News news) {
        String sql = "update news_list set newsTitle = ? , newsAuthor =? , newsKind =? where id =?";
        QueryRunner qr = new TxQueryRunner();
        try {

            //执行的参数
            Object[] params = {news.getNewsTitle(), news.getNewsAuthor(), news.getNewsKind(), news.getId()};

            int isOk = qr.update(sql, params);

            return isOk > 0 ? true : false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteById(long id) {

        String sql = "delete from news_list where id = ?";
        QueryRunner qr = new TxQueryRunner();
        try {
            //执行的参数
            Object[] params = {id};

            int isOk = qr.update(sql, params);

            return isOk > 0 ? true : false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
//        Connection connection = DBUtil.getConn();
//        String sql = "delete from news_list where id = ?";
//        PreparedStatement preparedStatement = null;
//        try {
//            preparedStatement = connection.prepareStatement(sql);
//            preparedStatement.setLong(1, id);
//            boolean flag = preparedStatement.execute();
//            if (flag) {
//                return true;
//            }
//            return false;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            DBUtil.close(connection, preparedStatement, preparedStatement, null);
//        }
//        return false;
    }

    @Override
    public List<News> loadNews(int startNum, Long newsKind) {
        String sql = "select * from news_list where newsKind= ? limit 0,?";
        QueryRunner qr = new TxQueryRunner();
        try {
            //执行的参数
            Object[] params = {newsKind, startNum};

            List<News> newsList = qr.query(sql, new BeanListHandler<News>(News.class), params);
            return null == newsList ? null : newsList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int countNews(Long newsKind) {

        String sql = "select * from news_list where newsKind = ?";
        QueryRunner qr = new TxQueryRunner();
        //执行的参数
        Object[] params = {newsKind};

        try {
            List<News> newsList = qr.query(sql, new BeanListHandler<News>(News.class), params);
            return newsList.size();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public News getNewsById(int newsID) {
        String sql = "select * from news_list where ID = ?";
        QueryRunner qr = new TxQueryRunner();
        try {
            //执行的参数
            Object[] params = {newsID};

            News news = qr.query(sql, new BeanHandler<News>(News.class), params);
            return news == null ? null : news;
        } catch (SQLException e) {
            e.printStackTrace();
    }
        return null;
    }

    @Override
    public boolean newsCollection(int newsId, Long userId, String newsTitle) {
        String sql = "insert into news_collection(`userId`,`newsId`,`newsTitle`,`collectionDate`) values (?,?,?,?)";
        QueryRunner qr = new TxQueryRunner();
        int falg = 0;
        try {
            //执行的参数
            Object[] params = {userId, newsId, newsTitle, new java.util.Date()};

            falg = qr.update(sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return falg == 1 ? true : false;
    }

    @Override
    public List<NewsCollection> listCollection(int userId) {
        String sql = "select * from news_collection where userId = ?";
        QueryRunner qr = new TxQueryRunner();
        try {
            //执行的参数
            Object[] params = {userId};

            List<NewsCollection> news = qr.query(sql, new BeanListHandler<NewsCollection>(NewsCollection.class), params);
            return null == news ? null : news;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<News> pageByCondition(String newsTitle, String newsAuthor, String newsKind, int cur) {
        String sql = getSqlUrl(newsTitle, newsAuthor, newsKind);
        StringBuilder sb = new StringBuilder(sql);
        //追加分页的信息，每页PageUtil.PAGE_SIZE条数据
        sb = sb.append(" limit " + PageUtil.PAGE_SIZE * (cur - 1) + " , " + PageUtil.PAGE_SIZE);

        QueryRunner qr = new TxQueryRunner();
        try {
            List<News> news = qr.query(sb.toString(), new BeanListHandler<News>(News.class));
            return null == news ? null : news;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 根据查询的条件构造sql语句
     */
    private String getSqlUrl(String newsTitle, String newsAuthor, String newsKind) {
        String sql = new String("select * from news_list where 1=1 ");
        if (null != newsTitle && (!"".equals(newsTitle))) {
            sql += "and newsTitle = '" + newsTitle + "'";
        }
        if (null != newsAuthor && (!"".equals(newsAuthor))) {
            sql += "and newsAuthor = '" + newsAuthor + "'";
        }
        if (null != newsKind && (!"".equals(newsKind))) {
            sql += "and newsKind = '" + newsKind + "'";
        }
        return sql;
    }
}
