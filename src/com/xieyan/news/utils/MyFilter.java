package com.xieyan.news.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 过滤中文乱码的问题
 */
public class MyFilter implements Filter {

    private String encoding = null;

    public void doFilter(ServletRequest arg0, ServletResponse arg1,
                         FilterChain arg2) throws IOException, ServletException {
        arg0.setCharacterEncoding(encoding);
        arg2.doFilter(arg0, arg1);
    }

    public void init(FilterConfig arg0) throws ServletException {
        encoding = arg0.getInitParameter("encoding"); //获得配置文件中的encoding
    }

    public void destroy() {

    }
}
