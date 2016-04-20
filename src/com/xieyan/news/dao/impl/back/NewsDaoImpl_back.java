package com.xieyan.news.dao.impl.back;

import com.xieyan.news.bean.News;
import com.xieyan.news.dao.NewsDao;
import com.xieyan.news.utils.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by xieayn on 16/4/11.
 */
public class NewsDaoImpl_back implements NewsDao {

    @Override
    public boolean addNews(News news) {
        Connection connection = DBUtil.getConn();
        String sql = "insert into news_list(`news_title`, `news_author`, `news_text`, `news_url`, `origin_type`,`date`,`update_date`, `valid`, `image_url`, `news_kind`) values (?,?,?,?,?,?,?,?,?,?)";// 编写sql语句，第一个字段不需要插入，是自动增加的
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
        }finally {
            DBUtil.close(connection, null, ps, null);
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
        String sql2 = "insert into news_kinds_list(`news_kinds`,`news_id`) values (?,?)";
        PreparedStatement ps2 = null;
        try {
            ps2 = connection.prepareStatement(sql2);
            ps2.setString(1, newsKind);
            ps2.setLong(2, geneNewsId);
            int isOk = ps2.executeUpdate();
            return isOk > 0 ? true : false;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            ps2.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(connection, null, ps2, null);
        }
        return false;
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
        }finally {
            DBUtil.close(connection, null, preparedStatement, null);
        }
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

    @Override
    public List<News> loadNews(int startNum) {
        return null;
    }

    @Override
    public int countNews() {
        return 0;
    }

    /**
     * 根据查询的条件构造sql语句
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
