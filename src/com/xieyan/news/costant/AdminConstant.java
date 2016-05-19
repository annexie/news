package com.xieyan.news.costant;

/**
 * 后台管理系统管理员所需要使用的一些常量类
 * Created by xieyan on 16/5/19.
 */
public interface AdminConstant {

    /**
     * 存放在session中的登录对象
     */
    public String ADMIN_LOGIN = "ADMIN_LOGIN";

    /**
     * 后台管理登录的时候的请求地址,在AdminLoginFilter中使用
     */
    public String BACK_ADMIN_LOGIN = "/back/admin";
}
