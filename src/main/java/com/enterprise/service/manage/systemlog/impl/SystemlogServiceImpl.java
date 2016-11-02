package com.enterprise.service.manage.systemlog.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.enterprise.core.ServersManage;
import com.enterprise.service.manage.systemlog.SystemlogService;
import com.enterprise.service.manage.systemlog.bean.Systemlog;
import com.enterprise.service.manage.systemlog.dao.SystemlogDao;
@Service("systemlogServiceManage")
public class SystemlogServiceImpl extends ServersManage<Systemlog, SystemlogDao> implements SystemlogService{

	@Override
	@Resource(name="systemlogDaoManage")
	public void setDao(SystemlogDao dao) {
		this.dao = dao;
	}

	@Override
	public Systemlog selectFirstOne(String account) {
		return dao.selectFirstOne(account);
	}
	

}
