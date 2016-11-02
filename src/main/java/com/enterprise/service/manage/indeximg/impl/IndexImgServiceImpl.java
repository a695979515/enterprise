package com.enterprise.service.manage.indeximg.impl;

import com.enterprise.core.ServersManage;
import com.enterprise.service.manage.indeximg.IndexImgService;
import com.enterprise.service.manage.indeximg.bean.IndexImg;
import com.enterprise.service.manage.indeximg.dao.IndexImgDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Cesiumai on 2016/5/27.
 */
@Service("indexImgServiceManage")
public class IndexImgServiceImpl extends ServersManage<IndexImg,IndexImgDao> implements IndexImgService {
    @Override
    @Resource(name="indexImgDaoManage")
    public void setDao(IndexImgDao dao) {
        this.dao = dao;
    }
}
