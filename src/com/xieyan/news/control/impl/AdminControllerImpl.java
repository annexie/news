package com.xieyan.news.control.impl;

import com.xieyan.news.bean.Admin;
import com.xieyan.news.control.AdminController;
import com.xieyan.news.dao.AdminDao;
import com.xieyan.news.dao.impl.AdminDaoImpl;

/**
 * Created by xieyan on 2016/4/13.
 */
public class AdminControllerImpl implements AdminController {

    @Override
    public Admin login(Admin admin) {
        AdminDao adminDao = new AdminDaoImpl();
        return adminDao.select(admin);
    }
}
