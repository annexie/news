package com.xieyan.news.dao.impl;

import com.xieyan.news.bean.User;
import com.xieyan.news.dao.UserDao;
import com.xieyan.news.utils.PageUtil;
import com.xieyan.news.utils.TxQueryRunner;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by xieyan on 16/1/6.
 */
public class UserDaoImpl implements UserDao {

    @Override
    public boolean register(User user) {
        String sql = "insert into user(`userName`,`userPassword`,`valid`) values (?,?,?)";
        QueryRunner qr = new TxQueryRunner();
        try {

            //执行的参数
            Object[] params = {user.getUserName(), user.getUserPassword(), user.getValid()};

            int isOk = qr.update(sql, params);

            return isOk > 0 ? true : false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
//        Connection connection = DBUtil.getConn();
//        String sql = "insert into user('useName','userPassword','valid') values (?,?,?)";// 编写sql语句，第一个字段不需要插入，是自动增加的
//        PreparedStatement preparedStatement = null;
//        boolean flag = false;
//        try {
//            preparedStatement = connection.prepareStatement(sql);
//            preparedStatement.setString(1, user.getUserName() + "");
//            preparedStatement.setString(2, user.getUserPassword() + "");
//            int isOk = preparedStatement.executeUpdate(); //执行executeUpdate()方法:这里是update数据相当于更新、插入
//            if (isOk > 0) {
//                return !flag;
//            } else {
//                return flag;
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        try {
//            preparedStatement.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        DBUtil.close(connection, null, preparedStatement, null);
//        return flag;
    }

    @Override
    public User login(String username, String password) {
        String sql = "select * from user where userName = ? and userPassword = ?";
        QueryRunner qr = new TxQueryRunner();
        try {

            //执行的参数
            Object[] params = {username, password};

            User user = qr.query(sql, new BeanHandler<User>(User.class), params);
            return user == null ? null : user;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

//        Connection connection = DBUtil.getConn();
//        String sql = "select * from user where userName = ? and userPassword = ?";// 编写sql语句，第一个字段不需要插入，是自动增加的
//        PreparedStatement preparedStatement = null;
//        try {
//            preparedStatement = connection.prepareStatement(sql);
//            preparedStatement.setString(1, username + "");
//            preparedStatement.setString(2, password + "");
//            ResultSet rs = preparedStatement.executeQuery();
//            if (rs.next()) {
//                User user = new User();
//                user.setUserName(rs.getString("userName"));
//                user.setId(rs.getLong("id"));
//                return user;
//            } else {
//                return null;
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        DBUtil.close(connection, preparedStatement, preparedStatement, null);
//        return null;
    }

    @Override
    public List<User> query(String username, String valid) {
        String sql = "select * from user where userName = ? and valid = ? ";
        QueryRunner qr = new TxQueryRunner();
        try {

            //执行的参数
            Object[] params = {username, valid};

            List<User> users = qr.query(sql, new BeanListHandler<User>(User.class), params);
            return users == null ? null : users;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
//
//        Connection connection = DBUtil.getConn();
//        String sql = "select * from user where userName = ? and valid = ? ";
//        PreparedStatement preparedStatement = null;
//        List<User> users = new ArrayList<User>();
//        try {
//            preparedStatement = connection.prepareStatement(sql);
//            preparedStatement.setString(1, username + "");
//            preparedStatement.setString(2, valid + "");
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()) {
//                User user = new User();
//                user.setUserName(rs.getString("userName"));
//                user.setId(rs.getLong("id"));
//                user.setValid(rs.getString("valid"));
//                users.add(user);
//            }
//            return users;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            DBUtil.close(connection, preparedStatement, preparedStatement, null);
//        }
//        return new ArrayList<User>();
    }

    @Override
    public List<User> queryByName(String username) {
        String sql = "select * from user where userName = ?";
        QueryRunner qr = new TxQueryRunner();
        try {

            //执行的参数
            Object[] params = {username};

            List<User> users = qr.query(sql, new BeanListHandler<User>(User.class), params);
            return users == null ? null : users;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

//        Connection connection = DBUtil.getConn();
//        String sql = "select * from user where userName = ? ";
//        PreparedStatement preparedStatement = null;
//        List<User> users = new ArrayList<User>();
//        try {
//            preparedStatement = connection.prepareStatement(sql);
//            preparedStatement.setString(1, username + "");
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()) {
//                User user = new User();
//                user.setUserName(rs.getString("userName"));
//                user.setId(rs.getLong("id"));
//                user.setValid(rs.getString("valid"));
//                users.add(user);
//            }
//            return users;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            DBUtil.close(connection, preparedStatement, preparedStatement, null);
//        }
//        return new ArrayList<User>();
    }

    @Override
    public List<User> queryByIsValid(String valid) {
        String sql = "select * from user where valid = ?";
        QueryRunner qr = new TxQueryRunner();
        try {

            //执行的参数
            Object[] params = {valid};

            List<User> users = qr.query(sql, new BeanListHandler<User>(User.class), params);
            return users == null ? null : users;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

//        Connection connection = DBUtil.getConn();
//        String sql = "select * from user where valid = ? ";
//        PreparedStatement preparedStatement = null;
//        List<User> users = new ArrayList<User>();
//        try {
//            preparedStatement = connection.prepareStatement(sql);
//            preparedStatement.setString(1, valid + "");
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()) {
//                User user = new User();
//                user.setUserName(rs.getString("userName"));
//                user.setId(rs.getLong("id"));
//                user.setValid(rs.getString("valid"));
//                users.add(user);
//            }
//            return users;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            DBUtil.close(connection, preparedStatement, preparedStatement, null);
//        }
//        return new ArrayList<User>();
    }

    @Override
    public List<User> listUser() {
        String sql = "select * from user";
        QueryRunner qr = new TxQueryRunner();
        try {

            List<User> users = qr.query(sql, new BeanListHandler<User>(User.class));
            return users == null ? null : users;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

//        Connection connection = DBUtil.getConn();
//        String sql = "select * from user";
//        PreparedStatement preparedStatement = null;
//        List<User> users = new ArrayList<User>();
//        try {
//            preparedStatement = connection.prepareStatement(sql);
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()) {
//                User user = new User();
//                user.setUserName(rs.getString("userName"));
//                user.setId(rs.getLong("id"));
//                user.setValid(rs.getString("valid"));
//                users.add(user);
//            }
//            return users;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            DBUtil.close(connection, preparedStatement, preparedStatement, null);
//        }
//        return new ArrayList<User>();
    }

    @Override
    public boolean update(User user) {
        String sql = "update user set userName = ? , valid =? where id =?";
        QueryRunner qr = new TxQueryRunner();
        try {
            Object[] params = {user.getUserName(), user.getValid(), user.getId()};
            int falg = qr.update(sql, params);
            return falg == 1 ? true : false;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
//        Connection connection = DBUtil.getConn();
//        String sql = "update user set userName = ? , valid =? where id =?";
//        PreparedStatement preparedStatement = null;
//        try {
//            preparedStatement = connection.prepareStatement(sql);
//            preparedStatement.setString(1, user.getUserName() + "");
//            preparedStatement.setString(2, user.getValid() + "");
//            preparedStatement.setLong(3, user.getId());
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
    public boolean delete(String id) {
        String sql = "delete from user where id = ?";
        QueryRunner qr = new TxQueryRunner();
        try {
            Object[] params = {id};
            int falg = qr.update(sql, params);
            return falg == 1 ? true : false;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
//        Connection connection = DBUtil.getConn();
//        String sql = "delete from user where id = ?";
//        PreparedStatement preparedStatement = null;
//        try {
//            preparedStatement = connection.prepareStatement(sql);
//            preparedStatement.setLong(1, Long.parseLong(id.trim()));
//            boolean flag = preparedStatement.execute();
//            return true;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            DBUtil.close(connection, preparedStatement, preparedStatement, null);
//        }
//        return false;
    }

    @Override
    public List<User> pageUserByCondition(String username, String valid, int cur) {
        String sql = getQuertSQL(username, valid, cur);
        QueryRunner qr = new TxQueryRunner();
        try {

            List<User> users = qr.query(sql, new BeanListHandler<User>(User.class));
            return users == null ? null : users;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private String getQuertSQL(String username, String valid, int cur) {
        StringBuilder sb = new StringBuilder("select * from user where 1=1  ");
        if ((null != username) && (!("").equals(username))) {
            sb = sb.append(" and userName = " + username);
        }
        if ((null != valid) && (!("").equals(valid))) {
            sb = sb.append(" and valid = " + valid);
        }
        //追加分页的信息，每页五条数据
        sb = sb.append(" limit " + PageUtil.PAGE_SIZE * (cur - 1) + " , " + PageUtil.PAGE_SIZE);
        return sb.toString();
    }
}
