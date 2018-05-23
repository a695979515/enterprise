package com.enterprise.service.impl;

import com.enterprise.dao.ArticleCategoryDao;
import com.enterprise.dao.ServersManage;
import com.enterprise.entity.ArticleCategory;
import com.enterprise.service.ArticleCategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Cesiumai on 2016/6/14.
 */
@Service("articleCategoryService")
public class ArticleCategoryServiceImpl extends ServersManage<ArticleCategory,ArticleCategoryDao> implements ArticleCategoryService {
    @Override
    @Resource(name="articleCategoryDao")
    public void setDao(ArticleCategoryDao dao) {
        this.dao = dao;
    }
}