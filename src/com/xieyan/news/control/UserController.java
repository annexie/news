package com.xieyan.news.control;

import com.xieyan.news.bean.User;

import java.util.List;

/**
 * 用户Controler接口
 * Created by xieyan on 16/1/6.
 */
public interface UserController {

    /**
     * 用户注册
     * @param user
     * @return
     */
    public boolean register(User user);

    /**
     * 用户登录
     * @param username
     * @param password
     * @return
     */
    public User login(String username, String password);

    /**
     * 用户退出
     * @param username
     * @return
     */
    public boolean logout(String username);

    /**
     * 根据调价查找用户
     * @param username
     * @param valid
     * @return
     */
    List<User> queryByCondition(String username, String valid);

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    boolean update(User user);

    boolean delete(String id);
}
