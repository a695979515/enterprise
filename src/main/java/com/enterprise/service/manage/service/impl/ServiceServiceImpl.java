package com.enterprise.service.manage.service.impl;

import com.enterprise.core.ServersManage;
import com.enterprise.service.manage.service.ServiceService;
import com.enterprise.service.manage.service.dao.ServiceDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Cesiumai on 2016/6/14.
 */
@Service("serviceSevcieManage")
public class ServiceServiceImpl extends ServersManage<com.enterprise.service.manage.service.bean.Service,ServiceDao> implements ServiceService{

    @Override
    @Resource(name="serviceDaoManage")
    public void setDao(ServiceDao dao) {
        this.dao = dao;
    }
}
