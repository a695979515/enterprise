package com.enterprise.dao.impl;

import com.enterprise.dao.BaseDao;
import com.enterprise.entity.ArticleCategory;
import com.enterprise.entity.page.PageModel;
import com.enterprise.dao.ArticleCategoryDao;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Cesiumai on 2016/6/14.
 */
@Repository("articleCategoryDao")
public class ArticleCategoryDaoImpl implements ArticleCategoryDao {
    @Resource
    private BaseDao dao;

    public void setDao(BaseDao dao) {
        this.dao = dao;
    }

    @Override
    public int insert(ArticleCategory articleCategory) {
        return dao.insert("articlecategory.insert", articleCategory);
    }

    @Override
    public int delete(ArticleCategory articleCategory) {
        return dao.delete("articlecategory.delete", articleCategory);
    }

    @Override
    public int update(ArticleCategory articleCategory) {
        return dao.update("articlecategory.update", articleCategory);
    }

    @Override
    public ArticleCategory selectOne(ArticleCategory articleCategory) {
        return (ArticleCategory) dao.selectOne("articlecategory.selectOne", articleCategory);
    }

    @Override
    public PageModel selectPageList(ArticleCategory articleCategory) {
        return dao.selectPageList("articlecategory.selectPageList","articlecategory.selectPageCount", articleCategory);
    }

    @Override
    public List<ArticleCategory> selectList(ArticleCategory articleCategory) {
        return dao.selectList("articlecategory.selectList", articleCategory);
    }

    @Override
    public int deleteById(int id) {
        return dao.delete("articlecategory.deleteById",id);
    }

    @Override
    public ArticleCategory selectById(int id) {
        return (ArticleCategory) dao.selectOne("articlecategory.selectById",id);
    }
}
