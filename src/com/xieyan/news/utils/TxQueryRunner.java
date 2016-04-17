package com.xieyan.news.utils;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * 继承自QueryRunner
 * TxQueryRunner本身使用了JdbcUtils,可以进行获取连接的数据源
 * Created by xieyan on 16/4/17.
 */
public class TxQueryRunner extends QueryRunner {

    /**
     * 进行批量操作
     * @param sql
     * @param params
     * @return
     * @throws SQLException
     */
    @Override
    public int[] batch(String sql, Object[][] params) throws SQLException {
        Connection con = JdbcUtils.getConnection();
        int[] result = super.batch(con, sql, params);
        JdbcUtils.releaseConnection(con);
        return result;
    }

    /**
     * 进行Query操作
     * @param sql
     * @param rsh
     * @param params
     * @param <T>
     * @return
     * @throws SQLException
     */
    @Override
    public <T> T query(String sql, ResultSetHandler<T> rsh, Object... params)
            throws SQLException {
        Connection con = JdbcUtils.getConnection();
        T result = super.query(con, sql, rsh, params);
        JdbcUtils.releaseConnection(con);
        return result;
    }

    @Override
    public <T> T query(String sql, ResultSetHandler<T> rsh) throws SQLException {
        Connection con = JdbcUtils.getConnection();
        T result = super.query(con, sql, rsh);
        JdbcUtils.releaseConnection(con);
        return result;
    }

    @Override
    public int update(String sql) throws SQLException {
        Connection con = JdbcUtils.getConnection();
        int result = super.update(con, sql);
        JdbcUtils.releaseConnection(con);
        return result;
    }

    @Override
    public int update(String sql, Object param) throws SQLException {
        Connection con = JdbcUtils.getConnection();
        int result = super.update(con, sql, param);
        JdbcUtils.releaseConnection(con);
        return result;
    }

    @Override
    public int update(String sql, Object... params) throws SQLException {
        Connection con = JdbcUtils.getConnection();
        int result = super.update(con, sql, params);
        JdbcUtils.releaseConnection(con);
        return result;
    }
}
