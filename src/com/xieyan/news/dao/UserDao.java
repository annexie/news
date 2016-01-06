package com.xieyan.news.dao;

import com.xieyan.news.bean.User;

/**
 * Created by xieyan on 16/1/6.
 */
public interface UserDao {

    public boolean register(User user);

    public User login(String username, String password);
}
