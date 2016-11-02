package com.enterprise.service.manage.systemSetting.dao;

import com.enterprise.core.DaoManage;
import com.enterprise.service.manage.systemSetting.bean.SystemSetting;

public interface SystemSettingDao extends DaoManage<SystemSetting>{
    String selectVersion();

}
