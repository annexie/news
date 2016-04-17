package com.xieyan.news.utils.test;

import com.xieyan.news.utils.JdbcUtils;
import org.junit.Test;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * JdbcUtils的测试工具类
 * Created by xieyan on 16/4/17.
 */
public class JdbcUtilsTest {

    /**
     * 底层使用了c3p0连接池，说明我们还要提供c3p0配置文件
     * @throws SQLException
     */
    @Test
    public void testGetConnection() throws SQLException {
        Connection con = JdbcUtils.getConnection();
        System.out.println(con);
        JdbcUtils.releaseConnection(con);
        System.out.println(con.isClosed());
    }

    /**
     * JdbcUtilst还提供了与事务相关的功能
     */
    @Test
    public void testTransaction() {
        try {
            JdbcUtils.beginTransaction();//开启事务

            // 多次操作,这里执行的关联表操作

            JdbcUtils.commitTransaction();//提交事务
        } catch (Exception e) {
            try {
                JdbcUtils.rollbackTransaction();//回滚事务
            } catch (SQLException e1) {
            }
        }
    }
}
