package com.xieyan.news.control;

import com.xieyan.news.bean.Admin;

import java.util.List;

/**
 * Created by xieyan on 2016/4/13.
 */
public interface AdminController {

    Admin login(Admin admin);

    List<Admin> listAdmin(String adminName, String adminRole);

    int addAdmin(Admin admin);

    boolean delete(Long id);

    boolean updateAdmin(Admin admin);
}
