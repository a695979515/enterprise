package com.enterprise.service.manage.about.dao.impl;

import com.enterprise.core.dao.BaseDao;
import com.enterprise.page.PageModel;
import com.enterprise.service.manage.about.bean.About;
import com.enterprise.service.manage.about.dao.AboutDao;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Cesiumai on 2016/7/8.
 */
@Repository("aboutDaoManage")
public class AboutDaoImpl implements AboutDao {
    @Resource
    private BaseDao dao;

    public void setDao(BaseDao dao) {
        this.dao = dao;
    }

    @Override
    public int insert(About about) {
        return dao.insert("manage.about.insert",about);
    }

    @Override
    public int delete(About about) {
        return 0;
    }

    @Override
    public int update(About about) {
        return dao.delete("manage.about.update",about);
    }

    @Override
    public About selectOne(About about) {
        return (About) dao.selectOne("manage.about.selectOne",about);
    }

    @Override
    public PageModel selectPageList(About about) {
        return dao.selectPageList("manage.about.selectPageList","manage.about.selectPageCount",about);
    }

    @Override
    public List<About> selectList(About about) {
        return dao.selectList("manage.about.selectList",about);
    }

    @Override
    public int deleteById(int id) {
        return dao.delete("manage.about.deleteById",id);
    }

    @Override
    public About selectById(int id) {
        return (About) dao.selectOne("manage.about.selectById",id);
    }
}
