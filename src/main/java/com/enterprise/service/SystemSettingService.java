package com.enterprise.service;


import com.enterprise.entity.SystemSetting;

public interface SystemSettingService extends Services<SystemSetting>{

    String selectVersion();
}
