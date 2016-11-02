package com.enterprise.service.manage.service.dao.impl;

import com.enterprise.core.dao.BaseDao;
import com.enterprise.page.PageModel;
import com.enterprise.service.manage.service.bean.Service;
import com.enterprise.service.manage.service.dao.ServiceDao;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Cesiumai on 2016/6/14.
 */
@Repository("serviceDaoManage")
public class ServiceDaoImpl implements ServiceDao {
    @Resource
    private BaseDao dao;

    public void setDao(BaseDao dao) {
        this.dao = dao;
    }

    @Override
    public int insert(Service service) {
        return dao.insert("manage.service.insert",service);
    }

    @Override
    public int delete(Service service) {
        return dao.delete("manage.service.delete",service);
    }

    @Override
    public int update(Service service) {
        return dao.update("manage.service.update",service);
    }

    @Override
    public Service selectOne(Service service) {
        return (Service) dao.selectOne("manage.service.selectOne",service);
    }

    @Override
    public PageModel selectPageList(Service service) {
        return dao.selectPageList("manage.service.selectPageList","manage.service.selectPageCount",service);
    }

    @Override
    public List<Service> selectList(Service service) {
        return dao.selectList("manage.service.selectList",service);
    }

    @Override
    public int deleteById(int id) {
        return dao.delete("manage.service.deleteById",id);
    }

    @Override
    public Service selectById(int id) {
        return (Service) dao.selectOne("manage.service.selectById",id);
    }
}
