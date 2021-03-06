package com.xieyan.news.dao.impl;

import com.xieyan.news.bean.Admin;
import com.xieyan.news.dao.AdminDao;
import com.xieyan.news.utils.TxQueryRunner;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by xieyan on 2016/4/13.
 */
public class AdminDaoImpl implements AdminDao {

    @Override
    public Admin select(Admin admin) throws SQLException {
        String sql = "select * from admin where adminName = ? and adminPassword = ?";
        QueryRunner qr = new TxQueryRunner();
        
        Admin result = qr.query(sql, new BeanHandler<Admin>(Admin.class), admin.getAdminName(), admin.getAdminPassword());
        System.out.println(result.toString());//转换成字符串打印出来
        if (null != result) {
            return result;
        } else {
            return null;
        }
    }

    @Override
    public List<Admin> listAdmin(String adminName, String adminRole) throws SQLException {
        String sql = getSqlUrl(adminName, adminRole);
        QueryRunner qr = new TxQueryRunner();
        List<Admin> result = qr.query(sql, new BeanListHandler<Admin>(Admin.class));
        System.out.println(result.toString());
        if (null != result) {
            return result;
        } else {
            return null;
        }
    }

    @Override
    public int add(Admin admin) {
        String sql = "insert into admin(`adminName`,`adminPassword`,`adminRole`) values (?,?,?)";
        QueryRunner qr = new TxQueryRunner();
        Object[] params = {admin.getAdminName(), admin.getAdminPassword(), admin.getAdminRole()};
        int isOk = 0;//执行
        try {
            isOk = qr.update(sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(isOk);
        if (isOk == 1) {
            return 1;
        } else {
            return 0;
        }
    }

    @Override
    public boolean delete(Long id) throws SQLException {
        String sql = "delete from admin where id = ?";
        QueryRunner qr = new TxQueryRunner();
        Object[] params = {id};
        int isOk = qr.update(sql, params);//执行
        System.out.println(isOk);
        return isOk == 1 ? true : false;
    }

    @Override
    public boolean udpateDao(Admin admin) throws SQLException {
        String sql = "update admin set adminName = ? , adminRole =? where id =?";
        QueryRunner qr = new TxQueryRunner();
        Object[] params = {admin.getAdminName(), admin.getAdminRole(), admin.getId()};
        int isOk = qr.update(sql, params);//执行
        System.out.println(isOk);
        if (isOk == 1) {
            return true;
        } else {
            return false;
        }
//        Connection connection = DBUtil.getConn();
//        String sql = "update admin set adminName = ? , adminRole =? where id =?";
//        PreparedStatement preparedStatement = null;
//        try {
//            preparedStatement = connection.prepareStatement(sql);
//            preparedStatement.setString(1, admin.getAdminName() + "");
//            preparedStatement.setString(2, admin.getAdminRole() + "");
//            preparedStatement.setLong(3, admin.getId());
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

    /**
     * 根据查询的条件构造sql语句
     */
    private String getSqlUrl(String adminName, String adminRole) {
        String sql = new String("select * from admin where 1=1 ");
        if (null != adminName && (!"".equals(adminName))) {
            sql += "and adminName = '" + adminName + "'";
        }
        if (null != adminRole && (!"".equals(adminRole))) {
            sql += "and adminRole = '" + adminRole + "'";
        }
        return sql;
    }
}
