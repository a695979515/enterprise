package com.enterprise.entity;

import com.enterprise.entity.page.PageModel;

import java.io.Serializable;

/**
 * 关于我们
 * Created by Cesiumai on 2016/7/14.
 */
public class About extends PageModel implements Serializable{
    private static final long serialVersionUID = 1L;
    private String contentHtml;

    @Override
    public void clean() {
        super.clean();
        contentHtml=null;
    }

    public String getContentHtml() {
        return contentHtml;
    }

    public void setContentHtml(String contentHtml) {
        this.contentHtml = contentHtml;
    }
}
