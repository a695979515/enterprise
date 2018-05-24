package com.enterprise.entity;

import com.enterprise.entity.page.PageModel;

import java.io.Serializable;

/**
 * 文章分类实体类
 * Created by Cesiumai on 2016/6/14.
 */
public class ArticleCategory extends PageModel implements Serializable{
    private static final long serialVersionUID = 1L;
    private String catename;        //分类名
    private int orders;             //排序
    private String code;            //编码
    private String description;     //描述

    @Override
    public void clean() {
        super.clean();
        catename=null;
        orders = 0;
        code = null;
        description=null;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCatename() {
        return catename;
    }

    public void setCatename(String catename) {
        this.catename = catename;
    }

    public int getOrders() {
        return orders;
    }

    public void setOrders(int orders) {
        this.orders = orders;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
