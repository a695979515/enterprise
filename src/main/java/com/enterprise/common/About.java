package com.enterprise.common;

import com.enterprise.page.PageModel;

import java.io.Serializable;

/**
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
