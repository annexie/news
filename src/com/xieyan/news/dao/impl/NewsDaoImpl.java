package com.xieyan.news.dao.impl;

import com.xieyan.news.bean.News;
import com.xieyan.news.bean.NewsCollection;
import com.xieyan.news.dao.NewsDao;
import com.xieyan.news.utils.JdbcUtils;
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
//        String sql = "insert into news_list(`newsTitle`, `newsAuthor`, `newsText`, `newsUrl`, `originType`,`date`,`updateDate`, `valid`, `imageUrl`, `newsKind`) values (?,?,?,?,?,?,?,?,?,?)";
//        QueryRunner qr = new TxQueryRunner();
//        int isOk = 0;
//        try {
//            //开启事务
//            JdbcUtils.beginTransaction();
//
//            //执行的参数
//            Object[] params = {new BeanHandler<News>(News.class), news.getNewsTitle(), news.getNewsAuthor(), news.getNewsText(),
//                    news.getNewsUrl(), news.getNewsOriginType(), new Date(System.currentTimeMillis()), new Date(System.currentTimeMillis()),
//                    news.getValid(), news.getNewImageUrl(), new Date(System.currentTimeMillis()), news.getNewsKind()};
//
//            isOk = qr.update(sql, params);
//            if (isOk > 0) {
//
//            }
//
//            JdbcUtils.commitTransaction();//提交事务
//        } catch (SQLException e) {
//            try {
//                JdbcUtils.rollbackTransaction();//回滚事务
//            } catch (SQLException e1) {
//            }
//            e.printStackTrace();
//        }

        Connection connection = null;
        try {
            connection = JdbcUtils.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String sql = "insert into news_list(`newsTitle`, `newsAuthor`, `newsText`, `newsUrl`, `originType`,`date`,`updateDate`, `valid`, `imageUrl`, `newsKind`) values (?,?,?,?,?,?,?,?,?,?)";// 编写sql语句，第一个字段不需要插入，是自动增加的
        PreparedStatement ps = null;
        boolean flag = false;
        try {
            ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, news.getNewsTitle() + "");
            ps.setString(2, news.getNewsAuthor() + "");
            ps.setString(3, news.getNewsText() + "");
            ps.setString(4, news.getNewsUrl() + "");
            ps.setString(5, news.getNewsOriginType());
            ps.setDate(6, new Date(System.currentTimeMillis()));
            ps.setDate(7, new Date(System.currentTimeMillis()));
            ps.setInt(8, news.getValid());
            ps.setString(9, news.getNewImageUrl());
            ps.setString(10, news.getNewsKind());
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

        String sql = "insert into news_kinds_list(`newsKinds`,`newId`) values (?,?)";
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

//        String sql2 = "insert into news_kinds_list(`news_kinds`,`news_id`) values (?,?)";
//        PreparedStatement ps2 = null;
//        try {
//            ps2 = connection.prepareStatement(sql2);
//            ps2.setString(1, newsKind);
//            ps2.setLong(2, geneNewsId);
//            int isOk = ps2.executeUpdate();
//            return isOk > 0 ? true : false;
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        try {
//            ps2.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            DBUtil.close(connection, null, ps2, null);
//        }
//        return false;
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

//        Connection connection = DBUtil.getConn();
//        String sql = getSqlUrl(newsTitle, newsAuthor, newsKind);
//        PreparedStatement preparedStatement = null;
//        List<News> newsList = new ArrayList<News>();
//        try {
//            preparedStatement = connection.prepareStatement(sql);
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()) {
//                News news = new News();
//                news.setId(rs.getLong("id"));
//                news.setNewsTitle(rs.getString("news_title"));
//                news.setNewsAuthor(rs.getString("news_author"));
//                news.setNewsKind(rs.getString("news_kind"));
//                news.setNewsText(rs.getString("news_text"));
//                news.setDate(rs.getDate("date"));
//                news.setValid(rs.getInt("valid"));
//                news.setNewsUrl(rs.getString("image_url"));
//                newsList.add(news);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        try {
//            preparedStatement.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            DBUtil.close(connection, null, preparedStatement, null);
//        }
//        return newsList;
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
//
//        Connection connection = DBUtil.getConn();
//        String sql = "update news_list set news_title = ? , news_author =? , news_kind =? where id =?";
//        PreparedStatement preparedStatement = null;
//        try {
//            preparedStatement = connection.prepareStatement(sql);
//            preparedStatement.setString(1, news.getNewsTitle() + "");
//            preparedStatement.setString(2, news.getNewsAuthor() + "");
//            preparedStatement.setString(3, news.getNewsKind());
//            preparedStatement.setLong(4, news.getId());
//            int flag = preparedStatement.executeUpdate();
//            if (flag == 1) {
//                return true;
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            DBUtil.close(connection, preparedStatement, preparedStatement, null);
//        }
//        return false;
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
