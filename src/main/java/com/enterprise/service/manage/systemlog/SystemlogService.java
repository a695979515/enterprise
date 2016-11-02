package com.enterprise.service.manage.systemlog;


import com.enterprise.core.Services;
import com.enterprise.service.manage.systemlog.bean.Systemlog;
public interface SystemlogService extends Services<Systemlog>{

	/**
	 * 根据账号查询最新的一次登陆记录
	 * @return
	 */
	Systemlog selectFirstOne(String account);
}
