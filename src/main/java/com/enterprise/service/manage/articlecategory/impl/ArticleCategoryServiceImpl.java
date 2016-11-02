package com.enterprise.service.manage.articlecategory.impl;

import com.enterprise.core.ServersManage;
import com.enterprise.service.manage.articlecategory.ArticleCategoryService;
import com.enterprise.service.manage.articlecategory.bean.ArticleCategory;
import com.enterprise.service.manage.articlecategory.dao.ArticleCategoryDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Cesiumai on 2016/6/14.
 */
@Service("articleCategoryServiceManage")
public class ArticleCategoryServiceImpl extends ServersManage<ArticleCategory,ArticleCategoryDao> implements ArticleCategoryService {
    @Override
    @Resource(name="articleCategoryDaoManage")
    public void setDao(ArticleCategoryDao dao) {
        this.dao = dao;
    }
}
