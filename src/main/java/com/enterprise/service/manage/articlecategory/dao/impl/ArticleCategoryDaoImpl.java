package com.enterprise.service.manage.articlecategory.dao.impl;

import com.enterprise.core.dao.BaseDao;
import com.enterprise.page.PageModel;
import com.enterprise.service.manage.articlecategory.bean.ArticleCategory;
import com.enterprise.service.manage.articlecategory.dao.ArticleCategoryDao;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Cesiumai on 2016/6/14.
 */
@Repository("articleCategoryDaoManage")
public class ArticleCategoryDaoImpl implements ArticleCategoryDao {
    @Resource
    private BaseDao dao;

    public void setDao(BaseDao dao) {
        this.dao = dao;
    }

    @Override
    public int insert(ArticleCategory articleCategory) {
        return dao.insert("manage.articlecategory.insert", articleCategory);
    }

    @Override
    public int delete(ArticleCategory articleCategory) {
        return dao.delete("manage.articlecategory.delete", articleCategory);
    }

    @Override
    public int update(ArticleCategory articleCategory) {
        return dao.update("manage.articlecategory.update", articleCategory);
    }

    @Override
    public ArticleCategory selectOne(ArticleCategory articleCategory) {
        return (ArticleCategory) dao.selectOne("manage.articlecategory.selectOne", articleCategory);
    }

    @Override
    public PageModel selectPageList(ArticleCategory articleCategory) {
        return dao.selectPageList("manage.articlecategory.selectPageList","manage.articlecategory.selectPageCount", articleCategory);
    }

    @Override
    public List<ArticleCategory> selectList(ArticleCategory articleCategory) {
        return dao.selectList("manage.articlecategory.selectList", articleCategory);
    }

    @Override
    public int deleteById(int id) {
        return dao.delete("manage.articlecategory.deleteById",id);
    }

    @Override
    public ArticleCategory selectById(int id) {
        return (ArticleCategory) dao.selectOne("manage.articlecategory.selectById",id);
    }
}
