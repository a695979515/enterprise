package com.enterprise.dao.impl;

import com.enterprise.dao.BaseDao;
import com.enterprise.entity.Service;
import com.enterprise.entity.page.PageModel;
import com.enterprise.dao.ServiceDao;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Cesiumai on 2016/6/14.
 */
@Repository("serviceDao")
public class ServiceDaoImpl implements ServiceDao {
    @Resource
    private BaseDao dao;

    public void setDao(BaseDao dao) {
        this.dao = dao;
    }

    @Override
    public int insert(Service service) {
        return dao.insert("service.insert",service);
    }

    @Override
    public int delete(Service service) {
        return dao.delete("service.delete",service);
    }

    @Override
    public int update(Service service) {
        return dao.update("service.update",service);
    }

    @Override
    public Service selectOne(Service service) {
        return (Service) dao.selectOne("service.selectOne",service);
    }

    @Override
    public PageModel selectPageList(Service service) {
        return dao.selectPageList("service.selectPageList","service.selectPageCount",service);
    }

    @Override
    public List<Service> selectList(Service service) {
        return dao.selectList("service.selectList",service);
    }

    @Override
    public int deleteById(int id) {
        return dao.delete("service.deleteById",id);
    }

    @Override
    public Service selectById(int id) {
        return (Service) dao.selectOne("service.selectById",id);
    }
}
