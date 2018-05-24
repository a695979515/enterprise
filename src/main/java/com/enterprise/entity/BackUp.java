package com.enterprise.entity;

import com.enterprise.entity.page.PageModel;

import java.io.Serializable;

/**
 * 备份实体类
 * Created by Cesiumai on 2016/6/7.
 */
public class BackUp extends PageModel implements Serializable {
    private static final long serialVersionUID = 1L;
    private String tableName;   //数据表名
    private String createtime;  //最后修改时间
    private String size;        //文件大小
    private String description; //描述
    private String fileName;    //文件名字

    @Override
    public void clean() {
        super.clean();
        tableName = null;
        createtime = null;
        size = null;
        description = null;
        fileName = null;
    }


    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public BackUp(String description, String tableName) {
        this.description = description;
        this.tableName = tableName;
    }

    public BackUp(String size, String fileName, String createtime) {
        this.size = size;
        this.fileName = fileName;
        this.createtime = createtime;
    }
}
