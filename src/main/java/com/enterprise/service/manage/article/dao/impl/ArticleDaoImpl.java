package com.enterprise.service.manage.article.dao.impl;

import com.enterprise.core.dao.BaseDao;
import com.enterprise.page.PageModel;
import com.enterprise.service.manage.article.bean.Article;
import com.enterprise.service.manage.article.dao.ArticleDao;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Cesiumai on 2016/6/14.
 */
@Repository("articleDaoManage")
public class ArticleDaoImpl implements ArticleDao{
    @Resource
    private BaseDao dao;

    public void setDao(BaseDao dao) {
        this.dao = dao;
    }

    @Override
    public int insert(Article article) {
        return dao.insert("manage.article.insert",article);
    }

    @Override
    public int delete(Article article) {
        return dao.delete("manage.article.delete",article);
    }

    @Override
    public int update(Article article) {
        return dao.update("manage.article.update",article);
    }

    @Override
    public Article selectOne(Article article) {
        return (Article) dao.selectOne("manage.article.selectOne",article);
    }

    @Override
    public PageModel selectPageList(Article article) {
        return dao.selectPageList("manage.article.selectPageList","manage.article.selectPageCount",article);
    }

    @Override
    public List<Article> selectList(Article article) {
        return dao.selectList("manage.article.selectList",article);
    }

    @Override
    public int deleteById(int id) {
        return dao.delete("manage.article.deleteById",id);
    }

    @Override
    public Article selectById(int id) {
        return (Article) dao.selectOne("manage.article.selectById",id);
    }
}
