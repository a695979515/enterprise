package com.enterprise.service.front.article.impl;

import com.enterprise.core.ServersManage;
import com.enterprise.service.front.article.ArticleService;
import com.enterprise.service.front.article.bean.Article;
import com.enterprise.service.front.article.dao.ArticleDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Cesiumai on 2016/6/14.
 */
@Service("articleSevcieFront")
public class ArticleServiceImpl extends ServersManage<Article,ArticleDao> implements ArticleService {

    @Override
    @Resource(name="articleDaoFront")
    public void setDao(ArticleDao dao) {
        this.dao = dao;
    }

    @Override
    public Article selectPrevious(int id) {
        return dao.selectPrevious(id);
    }

    @Override
    public Article selectNext(int id) {
        return dao.selectNext(id);
    }
}
