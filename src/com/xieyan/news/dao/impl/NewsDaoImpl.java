package com.xieyan.news.dao.impl;

import com.xieyan.news.bean.News;
import com.xieyan.news.dao.NewsDao;
import com.xieyan.news.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by xieayn on 16/4/11.
 */
public class NewsDaoImpl implements NewsDao {

    @Override
    public boolean addNews(News news) {
        Connection connection = DBUtil.getConn();
        String sql = "insert into news_list values (null,?,?)";// 编写sql语句，第一个字段不需要插入，是自动增加的
        PreparedStatement preparedStatement = null;
        boolean flag = false;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, news.getUserName() + "");
            preparedStatement.setString(2, news.getUserPassword() + "");
            preparedStatement.execute(); //执行executeUpdate()方法:这里是update数据相当于更新、插入
//            if (isOk > 0) {
//                return !flag;
//            } else {
//                return flag;
//            }
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
}
