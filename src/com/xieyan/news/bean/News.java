package com.xieyan.news.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by xieyan on 16/4/11.
 */
public class News implements Serializable {

    private Long id;
    private String newsTitle;
    private String newsAuthor;
    private String newsText;
    private String newsKind;
    private Date date;
    private Date updateDate;
    private String newsUrl;
    private String newImageUrl;
    private String newsOriginType;
    private int valid;

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public String getNewsAuthor() {
        return newsAuthor;
    }

    public void setNewsAuthor(String newsAuthor) {
        this.newsAuthor = newsAuthor;
    }

    public String getNewsText() {
        return newsText;
    }

    public void setNewsText(String newsText) {
        this.newsText = newsText;
    }

    public String getNewsKind() {
        return newsKind;
    }

    public void setNewsKind(String newsKind) {
        this.newsKind = newsKind;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        if (null == date) {
            this.date = new Date();
        } else {
            this.date = date;
        }
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        if (null == updateDate) {
            this.updateDate = new Date();
        } else {
            this.updateDate = updateDate;
        }
    }

    public String getNewsUrl() {
        return newsUrl;
    }

    public void setNewsUrl(String newsUrl) {
        this.newsUrl = newsUrl;
    }

    public int getValid() {
        return valid;
    }

    public void setValid(int valid) {
        this.valid = valid;
    }

    public String getNewsOriginType() {
        return newsOriginType;
    }

    public void setNewsOriginType(String newsOriginType) {
        this.newsOriginType = newsOriginType;
    }

    public String getNewImageUrl() {
        return newImageUrl;
    }

    public void setNewImageUrl(String newImageUrl) {
        this.newImageUrl = newImageUrl;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public News() {
    }

    public News(Long id, String newsTitle, String newsAuthor, String newsKind) {
        this.id = id;
        this.newsTitle = newsTitle;
        this.newsAuthor = newsAuthor;
        this.newsKind = newsKind;
    }
}
