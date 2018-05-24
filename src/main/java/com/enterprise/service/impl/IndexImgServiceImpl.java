package com.enterprise.service.impl;

import com.enterprise.dao.ServersManage;
import com.enterprise.entity.IndexImg;
import com.enterprise.service.IndexImgService;
import com.enterprise.dao.IndexImgDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Cesiumai on 2016/5/27.
 */
@Service("indexImgService")
public class IndexImgServiceImpl extends ServersManage<IndexImg,IndexImgDao> implements IndexImgService {
    @Override
    @Resource(name="indexImgDao")
    public void setDao(IndexImgDao dao) {
        this.dao = dao;
    }
}
