package com.enterprise.entity;

import com.enterprise.entity.page.PageModel;

import java.io.Serializable;

/**
 * 服务领域实体类
 * Created by Cesiumai on 2016/7/15.
 */
public class Service extends PageModel implements Serializable{
    private String title;
    private String contentHtml;
    private String status;
    private int orders;

    @Override
    public void clean() {
        super.clean();
        title=null;
        contentHtml=null;
        status=null;
        orders=0;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContentHtml() {
        return contentHtml;
    }

    public void setContentHtml(String contentHtml) {
        this.contentHtml = contentHtml;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getOrders() {
        return orders;
    }

    public void setOrders(int orders) {
        this.orders = orders;
    }
}
