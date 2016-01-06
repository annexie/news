package com.xieyan.news.bean;

/**
 * Created by xuliugen on 16/1/6.
 */
public class User {

    private int userId;

    private String username;

    private String sex;

    private String password;

    private String nickname;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public User(int userId, String username, String sex, String password, String nickname) {
        this.userId = userId;
        this.username = username;
        this.sex = sex;
        this.password = password;
        this.nickname = nickname;
    }

    public User() {
    }
}
