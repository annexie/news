package com.xieyan.news.utils;

import javax.servlet.*;
import java.io.IOException;

/**
 * 过滤中文乱码的问题
 * Created by xieyan on 16/1/6.
 */
public class EncodeFilter implements Filter {

    private String encoding = null;

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain filterChain) throws IOException, ServletException {
        request.setCharacterEncoding(encoding);
        filterChain.doFilter(request, response);
    }

    public void init(FilterConfig filterChain) throws ServletException {
        encoding = filterChain.getInitParameter("encoding"); //获得配置文件中的encoding
    }

    public void destroy() {

    }
}
