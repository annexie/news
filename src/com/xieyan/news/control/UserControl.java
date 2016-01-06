package com.xieyan.news.control;

import com.xieyan.news.bean.User;

public interface UserControl {
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
}
