package com.xieyan.news.dao;

import com.xieyan.news.bean.Admin;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by xieyan on 2016/4/13.
 */
public interface AdminDao {

    Admin select(Admin admin) throws SQLException;

    List<Admin> listAdmin(String adminName, String adminRole) throws SQLException;

    int add(Admin admin) throws SQLException;

    boolean delete(Long id) throws SQLException;

    boolean udpateDao(Admin admin) throws SQLException;
}
