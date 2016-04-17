package com.xieyan.news.control;

import com.xieyan.news.bean.Admin;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by xieyan on 2016/4/13.
 */
public interface AdminController {

    Admin login(Admin admin) throws SQLException;

    List<Admin> listAdmin(String adminName, String adminRole) throws SQLException;

    int addAdmin(Admin admin) throws SQLException;

    boolean delete(Long id) throws SQLException;

    boolean updateAdmin(Admin admin) throws SQLException;
}
