package com.xieyan.news.dao;

import com.xieyan.news.bean.Admin;

import java.util.List;

/**
 * Created by xieyan on 2016/4/13.
 */
public interface AdminDao {

    Admin select(Admin admin);

    List<Admin> listAdmin(String adminName, String adminRole);

    int add(Admin admin);
}
