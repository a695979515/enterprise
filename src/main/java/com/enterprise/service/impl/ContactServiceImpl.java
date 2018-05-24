package com.enterprise.service.impl;

import com.enterprise.dao.ServersManage;
import com.enterprise.entity.Contact;
import com.enterprise.service.ContactService;
import com.enterprise.dao.ContactDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Cesiumai on 2016/7/8.
 */
@Service("contactService")
public class ContactServiceImpl extends ServersManage<Contact,ContactDao> implements ContactService{
    @Override
    @Resource(name="contactDao")
    public void setDao(ContactDao dao) {
        this.dao=dao;
    }
}
