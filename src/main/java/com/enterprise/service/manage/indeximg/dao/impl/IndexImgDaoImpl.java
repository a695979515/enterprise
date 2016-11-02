package com.enterprise.service.manage.indeximg.dao.impl;

import com.enterprise.core.dao.BaseDao;
import com.enterprise.page.PageModel;
import com.enterprise.service.manage.indeximg.bean.IndexImg;
import com.enterprise.service.manage.indeximg.dao.IndexImgDao;
import org.springframework.stereotype.Repository;
import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Cesiumai on 2016/5/27.
 */
@Repository("indexImgDaoManage")
public class IndexImgDaoImpl implements IndexImgDao {
    @Resource
    private BaseDao dao;


    public void setDao(BaseDao dao) {
        this.dao = dao;
    }

    @Override
    public int insert(IndexImg indexImg) {
        return dao.insert("manage.indeximg.insert",indexImg);
    }

    @Override
    public int delete(IndexImg indexImg) {
        return dao.delete("manage.indeximg.delete",indexImg);
    }

    @Override
    public int update(IndexImg indexImg) {
        return dao.update("manage.indeximg.update",indexImg);
    }

    @Override
    public IndexImg selectOne(IndexImg indexImg) {
        return (IndexImg) dao.selectOne("manage.indeximg.selectOne",indexImg);
    }

    @Override
    public PageModel selectPageList(IndexImg indexImg) {
        return dao.selectPageList("manage.indeximg.selectPageList","manage.indeximg.selectPageCount",indexImg);
    }

    @Override
    public List<IndexImg> selectList(IndexImg indexImg) {
        return dao.selectList("manage.indeximg.selectList",indexImg);
    }

    @Override
    public int deleteById(int id) {
        return dao.delete("manage.indeximg.deleteById",id);
    }

    @Override
    public IndexImg selectById(int id) {
        return (IndexImg) dao.selectOne("manage.indeximg.selectById",id);
    }
}
