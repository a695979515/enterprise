package com.enterprise.service.manage.contact.dao.impl;

import com.enterprise.core.dao.BaseDao;
import com.enterprise.page.PageModel;
import com.enterprise.service.manage.contact.bean.Contact;
import com.enterprise.service.manage.contact.dao.ContactDao;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Cesiumai on 2016/7/8.
 */
@Repository("contactDaoManage")
public class ContactDaoImpl implements ContactDao{
    @Resource
    private BaseDao dao;

    public void setDao(BaseDao dao) {
        this.dao = dao;
    }

    @Override
    public int insert(Contact contact) {
        return dao.insert("manage.contact.insert",contact);
    }

    @Override
    public int delete(Contact contact) {
        return 0;
    }

    @Override
    public int update(Contact contact) {
        return dao.delete("manage.contact.update",contact);
    }

    @Override
    public Contact selectOne(Contact contact) {
        return (Contact) dao.selectOne("manage.contact.selectOne",contact);
    }

    @Override
    public PageModel selectPageList(Contact contact) {
        return dao.selectPageList("manage.contact.selectPageList","manage.contact.selectPageCount",contact);
    }

    @Override
    public List<Contact> selectList(Contact contact) {
        return dao.selectList("manage.contact.selectList",contact);
    }

    @Override
    public int deleteById(int id) {
        return dao.delete("manage.contact.deleteById",id);
    }

    @Override
    public Contact selectById(int id) {
        return (Contact) dao.selectOne("manage.contact.selectById",id);
    }
}
