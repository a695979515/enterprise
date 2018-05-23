package com.enterprise.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import com.enterprise.entity.SystemSetting;
import org.springframework.stereotype.Repository;

import com.enterprise.dao.BaseDao;
import com.enterprise.entity.page.PageModel;
import com.enterprise.dao.SystemSettingDao;
@Repository("systemSettingDao")
public class SystemSettingDaoImpl implements SystemSettingDao{
	@Resource
	private BaseDao dao;
	

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	@Override
	public int insert(SystemSetting e) {
		return dao.insert("systemSetting.insert", e);
	}

	@Override
	public int delete(SystemSetting e) {
		return dao.delete("systemSetting.delete",e);
	}

	@Override
	public int update(SystemSetting e) {
		return dao.update("systemSetting.update", e);
	}

	@Override
	public SystemSetting selectOne(SystemSetting e) {
		return (SystemSetting) dao.selectOne("systemSetting.selectOne", e);
	}

	@Override
	public PageModel selectPageList(SystemSetting e) {
		return dao.selectPageList("systemSetting.selectPageList", "systemSetting.selectPageCount", e);
	}

	@Override
	public List<SystemSetting> selectList(SystemSetting e) {
		return dao.selectList("systemSetting.selectList", e);
	}

	@Override
	public int deleteById(int id) {
		return dao.delete("systemSetting.deleteById", id);
	}

	@Override
	public SystemSetting selectById(int id) {
		return (SystemSetting) dao.selectOne("systemSetting.selectById", id);
	}

	@Override
	public String selectVersion() {
		return (String) dao.selectOne("systemSetting.selectVersion");
	}
}
