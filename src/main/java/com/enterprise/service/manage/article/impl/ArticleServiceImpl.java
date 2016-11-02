package com.enterprise.service.manage.article.impl;

import com.enterprise.core.ServersManage;
import com.enterprise.service.manage.article.ArticleService;
import com.enterprise.service.manage.article.bean.Article;
import com.enterprise.service.manage.article.dao.ArticleDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Cesiumai on 2016/6/14.
 */
@Service("articleSevcieManage")
public class ArticleServiceImpl extends ServersManage<Article,ArticleDao> implements ArticleService{

    @Override
    @Resource(name="articleDaoManage")
    public void setDao(ArticleDao dao) {
        this.dao = dao;
    }
}
