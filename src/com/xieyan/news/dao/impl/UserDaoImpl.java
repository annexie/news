package com.xieyan.news.dao.impl;

import com.xieyan.news.bean.User;
import com.xieyan.news.dao.UserDao;
import com.xieyan.news.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by xieyan on 16/1/6.
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
            preparedStatement.setString(1, user.getUserName() + "");
            preparedStatement.setString(2, user.getUserPassword() + "");
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
        String sql = "select * from user where user_name = ? and user_password = ?";// 编写sql语句，第一个字段不需要插入，是自动增加的
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username + "");
            preparedStatement.setString(2, password + "");
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserName(rs.getString("user_name"));
                user.setId(rs.getLong("id"));
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

    @Override
    public List<User> query(String username, String valid) {
        Connection connection = DBUtil.getConn();
        String sql = "select * from user where user_name = ? and valid = ? ";
        PreparedStatement preparedStatement = null;
        List<User> users = new ArrayList<User>();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username + "");
            preparedStatement.setString(2, valid + "");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserName(rs.getString("user_name"));
                user.setId(rs.getLong("id"));
                user.setValid(rs.getString("valid"));
                users.add(user);
            }
            return users;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, preparedStatement, null);
        }
        return new ArrayList<User>();
    }

    @Override
    public List<User> queryByName(String username) {
        Connection connection = DBUtil.getConn();
        String sql = "select * from user where user_name = ? ";
        PreparedStatement preparedStatement = null;
        List<User> users = new ArrayList<User>();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username + "");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserName(rs.getString("user_name"));
                user.setId(rs.getLong("id"));
                user.setValid(rs.getString("valid"));
                users.add(user);
            }
            return users;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, preparedStatement, null);
        }
        return new ArrayList<User>();
    }

    @Override
    public List<User> queryByIsValid(String valid) {
        Connection connection = DBUtil.getConn();
        String sql = "select * from user where valid = ? ";
        PreparedStatement preparedStatement = null;
        List<User> users = new ArrayList<User>();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, valid + "");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserName(rs.getString("user_name"));
                user.setId(rs.getLong("id"));
                user.setValid(rs.getString("valid"));
                users.add(user);
            }
            return users;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, preparedStatement, null);
        }
        return new ArrayList<User>();
    }

    @Override
    public List<User> listUser() {
        Connection connection = DBUtil.getConn();
        String sql = "select * from user";
        PreparedStatement preparedStatement = null;
        List<User> users = new ArrayList<User>();
        try {
            preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserName(rs.getString("user_name"));
                user.setId(rs.getLong("id"));
                user.setValid(rs.getString("valid"));
                users.add(user);
            }
            return users;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, preparedStatement, null);
        }
        return new ArrayList<User>();
    }

    @Override
    public boolean update(User user) {
        Connection connection = DBUtil.getConn();
        String sql = "update user set user_name = ? , valid =? where id =?";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user.getUserName() + "");
            preparedStatement.setString(2, user.getValid() + "");
            preparedStatement.setLong(3, user.getId());
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
    public boolean delete(String id) {
        Connection connection = DBUtil.getConn();
        String sql = "delete from user where id = ?";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, Long.parseLong(id.trim()));
            boolean flag = preparedStatement.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, preparedStatement, null);
        }
        return false;
    }
}
