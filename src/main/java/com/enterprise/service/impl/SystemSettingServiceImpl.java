package com.enterprise.service.impl;

import javax.annotation.Resource;

import com.enterprise.entity.SystemSetting;
import org.springframework.stereotype.Service;

import com.enterprise.dao.ServersManage;
import com.enterprise.service.SystemSettingService;
import com.enterprise.dao.SystemSettingDao;
@Service("systemSettingService")
public class SystemSettingServiceImpl extends ServersManage<SystemSetting, SystemSettingDao> implements SystemSettingService{

	@Override
	@Resource(name="systemSettingDao")
	public void setDao(SystemSettingDao dao) {
		this.dao = dao;
	}


	@Override
	public String selectVersion() {
		return dao.selectVersion();
	}
}
