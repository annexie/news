package com.xieyan.news.dao.impl.back;

import com.xieyan.news.bean.Admin;
import com.xieyan.news.dao.AdminDao;
import com.xieyan.news.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by xieyan on 2016/4/13.
 */
public class AdminDaoImpl_back implements AdminDao {

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
                return new Admin(rs.getString("admin_name"), null, rs.getInt("admin_role"));
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, preparedStatement, null);
        }
        return null;
    }

    @Override
    public List<Admin> listAdmin(String adminName, String adminRole) {
        Connection connection = DBUtil.getConn();
        String sql = getSqlUrl(adminName, adminRole);
        PreparedStatement preparedStatement = null;
        List<Admin> admins = new ArrayList<Admin>();
        try {
            preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Admin admin = new Admin();
                admin.setAdminName(rs.getString("admin_name"));
                admin.setAdminRole(rs.getInt("admin_role"));
                admin.setId(rs.getLong("id"));
                admins.add(admin);
            }
            return admins;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, preparedStatement, null);
        }
        return null;
    }

    @Override
    public int add(Admin admin) {
        Connection connection = DBUtil.getConn();
        PreparedStatement ps = null;
        String sql = "insert into admin(`admin_name`,`admin_password`,`admin_role`) values (?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, admin.getAdminName());
            ps.setString(2, admin.getAdminPassword());
            ps.setInt(3, admin.getAdminRole());
            int isOk = ps.executeUpdate();
            return isOk > 0 ? 1 : 0;

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, null, ps, null);
        }
        return 0;
    }

    @Override
    public boolean delete(Long id) {
        Connection connection = DBUtil.getConn();
        String sql = "delete from admin where id = ?";
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
    public boolean udpateDao(Admin admin) {
        Connection connection = DBUtil.getConn();
        String sql = "update admin set admin_name = ? , admin_role =? where id =?";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, admin.getAdminName() + "");
            preparedStatement.setString(2, admin.getAdminRole() + "");
            preparedStatement.setLong(3, admin.getId());
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

    /**
     * 根据查询的条件构造sql语句
     */
    private String getSqlUrl(String adminName, String adminRole) {
        String sql = new String("select * from admin where 1=1 ");
        if (null != adminName && (!"".equals(adminName))) {
            sql += "and admin_name = '" + adminName + "'";
        }
        if (null != adminRole && (!"".equals(adminRole))) {
            sql += "and admin_role = '" + adminRole + "'";
        }
        return sql;
    }
}
