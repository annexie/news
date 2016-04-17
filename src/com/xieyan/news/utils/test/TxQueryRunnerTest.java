package com.xieyan.news.utils.test;

import com.xieyan.news.utils.CommonUtils;
import com.xieyan.news.utils.JdbcUtils;
import com.xieyan.news.utils.TxQueryRunner;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.*;
import org.junit.Test;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * TxQueryRunner它是QueryRunner的子类！(commons-dbutils.jar)
 * 可用起来与QueryRunner相似的！
 * 我们的类支持事务！它底层使用了JdbcUtils来获取连接！
 * <p>
 * 简化jdbc的操作
 * QueryRunner的三个方法：
 * * update() --> insert、update、delete
 * * query() --> select
 * * batch() --> 批处理
 * Created by xieyan on 16/4/17.
 */
public class TxQueryRunnerTest {

    /**
     * 测试update()方法，用来执行insert、update、delete语句
     * @throws SQLException
     */
    @Test
    public void testUpdate() throws SQLException {
        String sql = "insert into admin(adminName,adminPassword,adminRole) values(?,?,?)";
        Object[] params = {"1234", "1234", 1};//给sql中对应的参数

        QueryRunner qr = new TxQueryRunner();//我们没有给对象提供连接池
        qr.update(sql, params);//执行sql，也不提供连接，它内部会使用JdbcUtils来获取连接
    }

    /**
     * 使用事务
     * @throws SQLException
     */
    @Test
    public void testUpdate2() throws Exception {
        try {
            JdbcUtils.beginTransaction();//开启事务

            String sql = "insert into t_person(pid,pname,age,sex) values(?,?,?,?)";
            QueryRunner qr = new TxQueryRunner();
            Object[] params = {"2", "p2", 2, "女"};
            qr.update(sql, params);//执行

            if (false) {
                throw new Exception();
            }

            params = new Object[]{"3", "p3", 3, "女"};
            qr.update(sql, params);//执行

            JdbcUtils.commitTransaction();//提交事务
        } catch (Exception e) {
            try {
                JdbcUtils.rollbackTransaction();//回滚事务
            } catch (SQLException e1) {
            }
            throw e;
        }
    }

    /**
     * 测试查询方法
     * 我们知道JDBC查询的结果的是ResultSet
     * 而QueryRunner查询的结果是通过ResultSet映射后的数据。
     * * QueryRunner第一步是执行select，得到ResultSet
     * * 把ResultSet转换成其他类型的！
     * 通过转换结果：
     * 　　　* javaBean:把结果集封装到javaBean中
     * * Map：把结果集封装到Map中
     * * 把结果集封装到Object中（结果集是单行单列）
     * @throws SQLException
     */
    /*
     * 单行结果集映射到javaBean中
	 */
    @Test
    public void testQuery1() throws SQLException {
        String sql = "select * from t_person where pid=?";
        QueryRunner qr = new TxQueryRunner();
        /*
         * 第二个参数类型为ResultSetHandler，它是一个接口，表示映射的结果类型。
		 * 
		 * BeanHandler --> 它是ResultSetHandler的实现类，它的作用是把结果集封装到Person对象中
		 */
        Person p = qr.query(sql, new BeanHandler<Person>(Person.class), "1");
        System.out.println(p);
    }

    /**
     * 使用BeanListHandler
     * 把多行结果集映射到List<Bean>，即多个JavaBean对象。
     * 一行结果集记录对应一个javaBean对象，多行就对应List<Bean>
     * @throws SQLException
     */
    @Test
    public void testQuery2() throws SQLException {
        String sql = "select * from t_person";
        QueryRunner qr = new TxQueryRunner();
        /*
         * 第二个参数类型为ResultSetHandler，它是一个接口，表示映射的结果类型。
		 * 
		 * BeanListHandler --> 它是ResultSetHandler的实现类，
		 *   它的作用是把结果集封装到List<Person>对象中
		 */
        List<Person> list = qr.query(sql, new BeanListHandler<Person>(Person.class));
        System.out.println(list);
    }

    /**
     * 使用MapHandler，把单行结果集封装到Map对象中
     * @throws SQLException
     */
    @Test
    public void testQuery3() throws SQLException {
        String sql = "select * from t_person where pid=?";
        QueryRunner qr = new TxQueryRunner();
        /*
         * 第二个参数类型为ResultSetHandler，它是一个接口，表示映射的结果类型。
		 * 
		 * BeanListHandler --> 它是ResultSetHandler的实现类，
		 *   它的作用是把结果集封装到List<Person>对象中
		 */
        Map<String, Object> map = qr.query(sql, new MapHandler(), "1");
        System.out.println(map);
    }

    /**
     * 使用MapListHandler，把多行结果集封装到List<Map>中，即多个Map
     * 一行对应一个Map，多行对应List<Map>
     * @throws SQLException
     */
    @Test
    public void testQuery4() throws SQLException {
        String sql = "select * from t_person";
        QueryRunner qr = new TxQueryRunner();
        /*
         * 第二个参数类型为ResultSetHandler，它是一个接口，表示映射的结果类型。
		 * 
		 * BeanListHandler --> 它是ResultSetHandler的实现类，
		 *   它的作用是把结果集封装到List<Person>对象中
		 */
        List<Map<String, Object>> mapList = qr.query(sql, new MapListHandler());
        System.out.println(mapList);
    }

    /**
     * 使用ScalarHandler，把单行单列的结果集封装到Object中
     * @throws SQLException
     */
    @Test
    public void testQuery5() throws SQLException {
        String sql = "select count(*) from t_person";//结果集是单行单列的
        QueryRunner qr = new TxQueryRunner();

        Object obj = qr.query(sql, new ScalarHandler());
        /*
         * 我们知道select count(1)，结果一定是个整数！
		 * > Integer
		 * > Long
		 * > BigInteger
		 * 
		 * 不同的驱动，结果不同！
		 * 无论是哪种类型，它都是Number类型！强转成Number一定不出错
		 */
        Number number = (Number) obj;
        long cnt = number.longValue();
        System.out.println(cnt);
    }

    /**
     * 一行结果集中包含了两张表的列
     * 使用MapHandler来处理
     * 1. 把结果集封装到map中
     * 2. 使用map生成Person对象
     * 3. 使用map生成address对象
     * 4. 把两个实体对象建立关系
     * @throws SQLException
     */
    @Test
    public void testQuery6() throws SQLException {
        String sql = "SELECT * FROM t_person p, t_address a WHERE p.aid=a.aid AND p.pid=?";
        QueryRunner qr = new TxQueryRunner();
        /*
         * 1. 得到Map
		 */
        Map map = qr.query(sql, new MapHandler(), "aaa");
        /*
		 * 2. 把Map中部分数据封装到Person中
		 */
        Person p = CommonUtils.toBean(map, Person.class);
		/*
		 * 3. 把Map中部分数据封装到Address中
		 */
        Address addr = CommonUtils.toBean(map, Address.class);
		/*
		 * 4. 建立两个实体的关系
		 */
        p.setAddress(addr);

        System.out.println(p);
    }
}
