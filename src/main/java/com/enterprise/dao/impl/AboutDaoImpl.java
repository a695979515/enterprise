package com.enterprise.dao.impl;

import com.enterprise.dao.BaseDao;
import com.enterprise.entity.About;
import com.enterprise.entity.page.PageModel;
import com.enterprise.dao.AboutDao;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Cesiumai on 2016/7/8.
 */
@Repository("aboutDao")
public class AboutDaoImpl implements AboutDao {
    @Resource
    private BaseDao dao;

    public void setDao(BaseDao dao) {
        this.dao = dao;
    }

    @Override
    public int insert(About about) {
        return dao.insert("about.insert",about);
    }

    @Override
    public int delete(About about) {
        return 0;
    }

    @Override
    public int update(About about) {
        return dao.delete("about.update",about);
    }

    @Override
    public About selectOne(About about) {
        return (About) dao.selectOne("about.selectOne",about);
    }

    @Override
    public PageModel selectPageList(About about) {
        return dao.selectPageList("about.selectPageList","about.selectPageCount",about);
    }

    @Override
    public List<About> selectList(About about) {
        return dao.selectList("about.selectList",about);
    }

    @Override
    public int deleteById(int id) {
        return dao.delete("about.deleteById",id);
    }

    @Override
    public About selectById(int id) {
        return (About) dao.selectOne("about.selectById",id);
    }
}
