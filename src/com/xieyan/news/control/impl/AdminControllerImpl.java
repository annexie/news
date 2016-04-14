package com.xieyan.news.control.impl;

import com.xieyan.news.bean.Admin;
import com.xieyan.news.control.AdminController;
import com.xieyan.news.dao.AdminDao;
import com.xieyan.news.dao.impl.AdminDaoImpl;

import java.util.List;

/**
 * Created by xieyan on 2016/4/13.
 */
public class AdminControllerImpl implements AdminController {

    @Override
    public Admin login(Admin admin) {
        AdminDao adminDao = new AdminDaoImpl();
        return adminDao.select(admin);
    }

    @Override
    public List<Admin> listAdmin(String adminName, String adminRole) {
        AdminDao adminDao = new AdminDaoImpl();
        return adminDao.listAdmin(adminName, adminRole);
    }

    @Override
    public int addAdmin(Admin admin) {
        AdminDao adminDao = new AdminDaoImpl();
        return adminDao.add(admin);
    }

    @Override
    public boolean delete(Long id) {
        AdminDao adminDao = new AdminDaoImpl();
        return adminDao.delete(id);
    }

    @Override
    public boolean updateAdmin(Admin admin) {
        AdminDao adminDao = new AdminDaoImpl();
        return adminDao.udpateDao(admin);
    }
}
