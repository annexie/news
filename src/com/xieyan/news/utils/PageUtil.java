package com.xieyan.news.utils;

/**
 * 进行分页使用的Utils
 * Created by xieyan on 2016/4/21.
 */
public class PageUtil {


    //默认分页的大小
    public static final int PAGE_SIZE = 5;

    /**
     * 根据总的记录数计算分页后页的大小
     * @param AllCount 总的记录数
     */
    public static int getPageCount(int AllCount) {

        int pageSize = 0;
        if (AllCount % PAGE_SIZE == 0) { //整页数据
            pageSize = AllCount / PAGE_SIZE;
        } else { //最后一页的数据大小没有PAGE_SIZE这么多
            pageSize = AllCount / PAGE_SIZE + 1;
        }

        return pageSize;
    }
}
