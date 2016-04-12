package com.xieyan.news.control.impl;

import com.xieyan.news.bean.User;
import com.xieyan.news.control.UserController;
import com.xieyan.news.dao.UserDao;
import com.xieyan.news.dao.impl.UserDaoImpl;

import java.util.List;

/**
 * 用户Controler实现类
 * Created by xieyan on 16/1/6.
 */
public class UserControllerImpl implements UserController {

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

    @Override
    public List<User> queryByCondition(String username, String valid) {
        UserDao userDao = new UserDaoImpl();
        if ((!"".equals(username)) && (!"".equals(valid)) && null != username && valid != null) { //用户名和valid均不为空
            return userDao.query(username, valid);
        } else if (((!"".equals(username) && null != username)) && (("".equals(valid)) || null == valid)) {//用户名不为空valid为空
            return userDao.queryByName(username);
        } else if ((("".equals(username) || null == username)) && ((!"".equals(valid) && null != valid))) {//用户名为空valid不为空
            return userDao.queryByIsValid(valid);
        }
        return userDao.listUser(); //都为空的情况
    }

    @Override
    public boolean update(User user) {
        UserDao userDao = new UserDaoImpl();
        return userDao.update(user);
    }

    @Override
    public boolean delete(String id) {
        UserDao userDao = new UserDaoImpl();
        return userDao.delete(id);
    }
}
