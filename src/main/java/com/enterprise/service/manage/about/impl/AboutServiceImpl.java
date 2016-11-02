package com.enterprise.service.manage.about.impl;

import com.enterprise.core.ServersManage;
import com.enterprise.service.manage.about.AboutService;
import com.enterprise.service.manage.about.bean.About;
import com.enterprise.service.manage.about.dao.AboutDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Cesiumai on 2016/7/8.
 */
@Service("aboutServiceManage")
public class AboutServiceImpl extends ServersManage<About,AboutDao> implements AboutService{
    @Override
    @Resource(name="aboutDaoManage")
    public void setDao(AboutDao dao) {
        this.dao=dao;
    }
}
