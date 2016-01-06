package com.xieyan.news.control;

import com.xieyan.news.bean.User;

/**
 * 用户Controler接口
 * Created by xieyan on 16/1/6.
 */
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
