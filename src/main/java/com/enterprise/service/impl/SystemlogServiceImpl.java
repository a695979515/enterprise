package com.enterprise.service.impl;

import javax.annotation.Resource;

import com.enterprise.entity.Systemlog;
import org.springframework.stereotype.Service;

import com.enterprise.dao.ServersManage;
import com.enterprise.service.SystemlogService;
import com.enterprise.dao.SystemlogDao;
@Service("systemlogService")
public class SystemlogServiceImpl extends ServersManage<Systemlog, SystemlogDao> implements SystemlogService{

	@Override
	@Resource(name="systemlogDao")
	public void setDao(SystemlogDao dao) {
		this.dao = dao;
	}

	@Override
	public Systemlog selectFirstOne(String account) {
		return dao.selectFirstOne(account);
	}
	

}
