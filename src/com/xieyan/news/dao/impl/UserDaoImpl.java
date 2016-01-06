package com.xieyan.news.dao.impl;

import com.xieyan.news.bean.User;
import com.xieyan.news.dao.UserDao;
import com.xieyan.news.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by xuliugen on 16/1/6.
 */
public class UserDaoImpl implements UserDao {

    @Override
    public boolean register(User user) {
        Connection connection = DBUtil.getConn();
        String sql = "insert into user values (null,?,?)";// 编写sql语句，第一个字段不需要插入，是自动增加的
        PreparedStatement preparedStatement = null;
        boolean flag = false;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user.getUsername() + "");
            preparedStatement.setString(2, user.getPassword() + "");
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
    public User login(String username, String password) {
        Connection connection = DBUtil.getConn();
        String sql = "select * from user where username = ? and password = ? ";// 编写sql语句，第一个字段不需要插入，是自动增加的
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username + "");
            preparedStatement.setString(2, password + "");
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUsername(rs.getString("username"));
                user.setUserId(rs.getInt("id"));
                return user;
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DBUtil.close(connection, preparedStatement, preparedStatement, null);
        return null;
    }
}
