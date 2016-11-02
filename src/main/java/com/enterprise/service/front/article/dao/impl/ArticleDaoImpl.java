package com.enterprise.service.front.article.dao.impl;

import com.enterprise.core.dao.BaseDao;
import com.enterprise.page.PageModel;
import com.enterprise.service.front.article.bean.Article;
import com.enterprise.service.front.article.dao.ArticleDao;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Cesiumai on 2016/6/14.
 */
@Repository("articleDaoFront")
public class ArticleDaoImpl implements ArticleDao {
    @Resource
    private BaseDao dao;

    public void setDao(BaseDao dao) {
        this.dao = dao;
    }

    @Override
    public int insert(Article article) {
        return dao.insert("front.article.insert",article);
    }

    @Override
    public int delete(Article article) {
        return dao.delete("front.article.delete",article);
    }

    @Override
    public int update(Article article) {
        return dao.update("front.article.update",article);
    }

    @Override
    public Article selectOne(Article article) {
        return (Article) dao.selectOne("front.article.selectOne",article);
    }

    @Override
    public PageModel selectPageList(Article article) {
        return dao.selectPageList("front.article.selectPageList","front.article.selectPageCount",article);
    }

    @Override
    public List<Article> selectList(Article article) {
        return dao.selectList("front.article.selectList",article);
    }

    @Override
    public int deleteById(int id) {
        return dao.delete("front.article.deleteById",id);
    }

    @Override
    public Article selectById(int id) {
        return (Article) dao.selectOne("front.article.selectById",id);
    }

    @Override
    public Article selectPrevious(int id) {
        return (Article) dao.selectOne("front.article.selectPrevious",id);
    }

    @Override
    public Article selectNext(int id) {
        return (Article) dao.selectOne("front.article.selectNext",id);
    }
}
