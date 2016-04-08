package com.xieyan.news.bean;

/**
 * 用户Bean
 * Created by xieyan on 16/1/6.
 */
public class User {

    private int id;

    private String userName;

    private String userPassword;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }
}
