package com.enterprise.service.manage.systemSetting.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.enterprise.core.ServersManage;
import com.enterprise.service.manage.systemSetting.SystemSettingService;
import com.enterprise.service.manage.systemSetting.bean.SystemSetting;
import com.enterprise.service.manage.systemSetting.dao.SystemSettingDao;
@Service("systemSettingServiceManage")
public class SystemSettingServiceImpl extends ServersManage<SystemSetting, SystemSettingDao> implements SystemSettingService{

	@Override
	@Resource(name="systemSettingDaoManage")
	public void setDao(SystemSettingDao dao) {
		this.dao = dao;
	}


	@Override
	public String selectVersion() {
		return dao.selectVersion();
	}
}
