package com.xieyan.news.control.impl;

import com.xieyan.news.bean.Admin;
import com.xieyan.news.control.AdminController;
import com.xieyan.news.dao.AdminDao;
import com.xieyan.news.dao.impl.AdminDaoImpl;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by xieyan on 2016/4/13.
 */
public class AdminControllerImpl implements AdminController {

    @Override
    public Admin login(Admin admin) throws SQLException {
        AdminDao adminDao = new AdminDaoImpl();
        return adminDao.select(admin);
    }

    @Override
    public List<Admin> listAdmin(String adminName, String adminRole) throws SQLException {
        AdminDao adminDao = new AdminDaoImpl();
        return adminDao.listAdmin(adminName, adminRole);
    }

    @Override
    public int addAdmin(Admin admin) throws SQLException {
        AdminDao adminDao = new AdminDaoImpl();
        return adminDao.add(admin);
    }

    @Override
    public boolean delete(Long id) throws SQLException {
        AdminDao adminDao = new AdminDaoImpl();
        return adminDao.delete(id);
    }

    @Override
    public boolean updateAdmin(Admin admin) throws SQLException {
        AdminDao adminDao = new AdminDaoImpl();
        return adminDao.udpateDao(admin);
    }
}
