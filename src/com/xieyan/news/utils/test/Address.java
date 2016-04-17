package com.xieyan.news.utils.test;

/**
 * Created by xieyan on 16/4/17.
 */
public class Address {
    private String aid;//主键
    private String province;//省
    private String city;//市
    private String district;//区
    private String street;//街道

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    @Override
    public String toString() {
        return "Address [aid=" + aid + ", province=" + province + ", city="
                + city + ", district=" + district + ", street=" + street + "]";
    }
}
