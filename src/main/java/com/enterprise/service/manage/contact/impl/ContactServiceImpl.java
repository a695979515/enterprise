package com.enterprise.service.manage.contact.impl;

import com.enterprise.core.ServersManage;
import com.enterprise.service.manage.contact.ContactService;
import com.enterprise.service.manage.contact.bean.Contact;
import com.enterprise.service.manage.contact.dao.ContactDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Cesiumai on 2016/7/8.
 */
@Service("contactServiceManage")
public class ContactServiceImpl extends ServersManage<Contact,ContactDao> implements ContactService{
    @Override
    @Resource(name="contactDaoManage")
    public void setDao(ContactDao dao) {
        this.dao=dao;
    }
}
