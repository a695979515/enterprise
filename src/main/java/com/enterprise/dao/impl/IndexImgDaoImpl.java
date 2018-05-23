package com.enterprise.dao.impl;

import com.enterprise.dao.BaseDao;
import com.enterprise.entity.IndexImg;
import com.enterprise.entity.page.PageModel;
import com.enterprise.dao.IndexImgDao;
import org.springframework.stereotype.Repository;
import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Cesiumai on 2016/5/27.
 */
@Repository("indexImgDao")
public class IndexImgDaoImpl implements IndexImgDao {
    @Resource
    private BaseDao dao;


    public void setDao(BaseDao dao) {
        this.dao = dao;
    }

    @Override
    public int insert(IndexImg indexImg) {
        return dao.insert("indeximg.insert",indexImg);
    }

    @Override
    public int delete(IndexImg indexImg) {
        return dao.delete("indeximg.delete",indexImg);
    }

    @Override
    public int update(IndexImg indexImg) {
        return dao.update("indeximg.update",indexImg);
    }

    @Override
    public IndexImg selectOne(IndexImg indexImg) {
        return (IndexImg) dao.selectOne("indeximg.selectOne",indexImg);
    }

    @Override
    public PageModel selectPageList(IndexImg indexImg) {
        return dao.selectPageList("indeximg.selectPageList","indeximg.selectPageCount",indexImg);
    }

    @Override
    public List<IndexImg> selectList(IndexImg indexImg) {
        return dao.selectList("indeximg.selectList",indexImg);
    }

    @Override
    public int deleteById(int id) {
        return dao.delete("indeximg.deleteById",id);
    }

    @Override
    public IndexImg selectById(int id) {
        return (IndexImg) dao.selectOne("indeximg.selectById",id);
    }
}
