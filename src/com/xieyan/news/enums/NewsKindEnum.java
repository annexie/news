package com.xieyan.news.enums;

/**
 * 用户是否有效枚举类型
 * Created by xieyan on 16/5/19.
 */
public enum NewsKindEnum {

    JI_SUAN_JI(1, "1"),
    KE_JI(2, "2"),
    REN_WEN(3, "3");

    public Integer code;
    public String value;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    NewsKindEnum(Integer value, String desc) {
        this.code = value;
        this.value = desc;
    }

    public static NewsKindEnum getTypeByCode(Integer code) {
        NewsKindEnum defaultState = JI_SUAN_JI;
        for (NewsKindEnum newsKindEnum : NewsKindEnum.values()) {
            if (newsKindEnum.code.equals(code)) {
                return newsKindEnum;
            }
        }
        return defaultState;
    }

    public static String getDescByCode(Integer code) {
        return getTypeByCode(code).value;
    }
}
