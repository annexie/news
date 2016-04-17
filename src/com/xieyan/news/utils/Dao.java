package com.xieyan.news.utils;

import org.apache.commons.dbutils.QueryRunner;

import java.sql.SQLException;

public class Dao {

    /**
     * 它不知道是否在事务中！
     * 如果在事务中，不能关闭！因为事务中可能存在后续方法调用，后续方法还需要使用同一个con
     * 如果不在事务中，这就必须要关闭！
     * @param id
     * @param balance
     * @throws SQLException
     */
    public void update(int id, double balance) throws SQLException {
        String sql = "select * from admin where admin_name = ? and admin_password = ?";
        QueryRunner qr = new TxQueryRunner();
        qr.update(sql, "123", "123");
    }
}
