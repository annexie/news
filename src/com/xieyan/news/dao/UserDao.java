package com.xieyan.news.dao;

import com.xieyan.news.bean.User;

import java.util.List;

/**
 * Created by xieyan on 16/1/6.
 */
public interface UserDao {

    public boolean register(User user);

    public User login(String username, String password);

    List<User> query(String username, String valid);

    List<User> queryByName(String username);

    List<User> queryByIsValid(String valid);

    List<User> listUser();

    boolean update(User user);
}
