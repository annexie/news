package com.xieyan.news.utils.test;

/**
 * Created by xieyan on 16/4/17.
 */
public class Person {
    private String pid;
    private String pname;
    private int age;
    private String sex;

    private Address address;

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "Person [pid=" + pid + ", pname=" + pname + ", age=" + age
                + ", sex=" + sex + ", address=" + address + "]";
    }


}
