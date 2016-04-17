package com.xieyan.news.bean;

import java.io.Serializable;

/**
 * Created by xieyan on 2016/4/13.
 */
public class Admin implements Serializable {

    private Long id;

    private String adminName;

    private String adminPassword;

    private int adminRole;

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    public int getAdminRole() {
        return adminRole;
    }

    public void setAdminRole(int adminRole) {
        this.adminRole = adminRole;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Admin(String adminName, String adminPassword, int adminRole) {
        this.adminName = adminName;
        this.adminPassword = adminPassword;
        this.adminRole = adminRole;
    }

    public Admin(String adminName, int adminRole, Long id) {
        this.adminName = adminName;
        this.adminRole = adminRole;
        this.id = id;
    }

    public Admin(String adminName, String adminPassword) {
        this.adminName = adminName;
        this.adminPassword = adminPassword;
    }

    public Admin() {
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", adminName='" + adminName + '\'' +
                ", adminPassword='" + adminPassword + '\'' +
                ", adminRole=" + adminRole +
                '}';
    }
}
