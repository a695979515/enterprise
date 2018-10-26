package com.enterprise.entity;

import com.enterprise.entity.page.PageModel;

import java.io.Serializable;

/**
 * 文章实体类
 * Created by Cesiumai on 2016/6/14.
 */
public class Article extends PageModel implements Serializable{
    private static final long serialVersionUID = 1L;
    private String title;       //文章标题
    private String categoryId;  //文章所属类别Id
    private String content;     //文章内容
    private String keywords;    //文章关键字
    private String createtime;  //创建时间
    private String hit;         //点击次数
    private String image;       //缩略图
    private String description; //描述
    private String status;      //状态
    private String catename;    //分类名
    private int orders; //排序

    @Override
    public void clean() {
        super.clean();
        title=null;
        categoryId=null;
        content=null;
        keywords=null;
        createtime=null;
        hit=null;
        image=null;
        description = null;
        status = null;
        catename = null;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getHit() {
        return hit;
    }

    public void setHit(String hit) {
        this.hit = hit;
    }


    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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


}
