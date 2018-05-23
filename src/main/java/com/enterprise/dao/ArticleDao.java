package com.enterprise.dao;


import com.enterprise.entity.Article;

/**
 * Created by Cesiumai on 2016/6/14.
 */
public interface ArticleDao extends DaoManage<Article>{
    Article selectPrevious(int id);
    Article selectNext(int id);
}
