package com.enterprise.service.manage.systemlog.dao;

import com.enterprise.core.DaoManage;
import com.enterprise.service.manage.systemlog.bean.Systemlog;

public interface SystemlogDao extends DaoManage<Systemlog>{

	Systemlog selectFirstOne(String account);

}
