package com.enterprise.service.manage.systemSetting;


import com.enterprise.core.Services;
import com.enterprise.service.manage.systemSetting.bean.SystemSetting;
public interface SystemSettingService extends Services<SystemSetting>{

    String selectVersion();
}
