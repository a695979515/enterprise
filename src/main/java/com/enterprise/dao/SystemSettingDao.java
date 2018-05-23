package com.enterprise.dao;


import com.enterprise.entity.SystemSetting;

public interface SystemSettingDao extends DaoManage<SystemSetting>{
    String selectVersion();

}
