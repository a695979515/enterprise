package com.enterprise.service.impl;

import com.enterprise.dao.ServersManage;
import com.enterprise.service.ServiceService;
import com.enterprise.dao.ServiceDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Cesiumai on 2016/6/14.
 */
@Service("serviceService")
public class ServiceServiceImpl extends ServersManage<com.enterprise.entity.Service,ServiceDao> implements ServiceService{

    @Override
    @Resource(name="serviceDao")
    public void setDao(ServiceDao dao) {
        this.dao = dao;
    }
}
