package com.enterprise.service.manage.systemSetting.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.enterprise.core.dao.BaseDao;
import com.enterprise.page.PageModel;
import com.enterprise.service.manage.systemSetting.bean.SystemSetting;
import com.enterprise.service.manage.systemSetting.dao.SystemSettingDao;
@Repository("systemSettingDaoManage")
public class SystemSettingDaoImpl implements SystemSettingDao{
	@Resource
	private BaseDao dao;
	

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	@Override
	public int insert(SystemSetting e) {
		return dao.insert("manage.systemSetting.insert", e);
	}

	@Override
	public int delete(SystemSetting e) {
		return dao.delete("manage.systemSetting.delete",e);
	}

	@Override
	public int update(SystemSetting e) {
		return dao.update("manage.systemSetting.update", e);
	}

	@Override
	public SystemSetting selectOne(SystemSetting e) {
		return (SystemSetting) dao.selectOne("manage.systemSetting.selectOne", e);
	}

	@Override
	public PageModel selectPageList(SystemSetting e) {
		return dao.selectPageList("manage.systemSetting.selectPageList", "manage.systemSetting.selectPageCount", e);
	}

	@Override
	public List<SystemSetting> selectList(SystemSetting e) {
		return dao.selectList("manage.systemSetting.selectList", e);
	}

	@Override
	public int deleteById(int id) {
		return dao.delete("manage.systemSetting.deleteById", id);
	}

	@Override
	public SystemSetting selectById(int id) {
		return (SystemSetting) dao.selectOne("manage.systemSetting.selectById", id);
	}

	@Override
	public String selectVersion() {
		return (String) dao.selectOne("manage.systemSetting.selectVersion");
	}
}
