package com.xieyan.news.control.impl;

import com.xieyan.news.bean.User;
import com.xieyan.news.control.UserControl;
import com.xieyan.news.dao.UserDao;
import com.xieyan.news.dao.impl.UserDaoImpl;

/**
 * 用户Controler实现类
 * Created by xieyan on 16/1/6.
 */
public class UserControlImpl implements UserControl {

    public boolean register(User user) {
        UserDao userDao = new UserDaoImpl();
        return userDao.register(user);
    }

    public User login(String username, String password) {
        UserDao userDao = new UserDaoImpl();
        return userDao.login(username, password);
    }

    public boolean logout(String username) {
        return false;
    }

}
