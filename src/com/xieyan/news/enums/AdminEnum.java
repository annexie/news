package com.xieyan.news.enums;

/**
 * Created by xieyan on 2016/4/21.
 */
public enum AdminEnum {

    SUPER_ADMIN(1, "SUPER_ADMIN"),
    SENIOR_ADMIN(2, "SENIOR_ADMIN"),
    NORMAL_ADMIN(3, "NORMAL_ADMIN");

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

    AdminEnum(Integer value, String desc) {
        this.code = value;
        this.value = desc;
    }

    public static AdminEnum getTypeByCode(Integer code) {
        AdminEnum defaultState = NORMAL_ADMIN;
        for (AdminEnum adminEnum : AdminEnum.values()) {
            if (adminEnum.code.equals(code)) {
                return adminEnum;
            }
        }
        return defaultState;
    }

    public static String getDescByCode(Integer code) {
        return getTypeByCode(code).value;
    }
}
