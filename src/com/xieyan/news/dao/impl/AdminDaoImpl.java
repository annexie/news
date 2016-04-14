package com.xieyan.news.dao.impl;

import com.xieyan.news.bean.Admin;
import com.xieyan.news.dao.AdminDao;
import com.xieyan.news.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by xieyan on 2016/4/13.
 */
public class AdminDaoImpl implements AdminDao {

    @Override
    public Admin select(Admin admin) {
        Connection connection = DBUtil.getConn();
        String sql = "select * from admin where admin_name = ? and admin_password = ?";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, admin.getAdminName() + "");
            preparedStatement.setString(2, admin.getAdminPassword() + "");
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return new Admin(rs.getString("admin_name"), null, rs.getString("admin_role"));
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
