package com.xieyan.news.enums;

/**
 * 用户是否有效枚举类型
 * Created by xieyan on 16/5/19.
 */
public enum ValidEnum {

    VALID(1, "1"),
    INVALID(0, "0");

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

    ValidEnum(Integer value, String desc) {
        this.code = value;
        this.value = desc;
    }

    public static ValidEnum getTypeByCode(Integer code) {
        ValidEnum defaultState = VALID;
        for (ValidEnum validEnum : ValidEnum.values()) {
            if (validEnum.code.equals(code)) {
                return validEnum;
            }
        }
        return defaultState;
    }

    public static String getDescByCode(Integer code) {
        return getTypeByCode(code).value;
    }
}
