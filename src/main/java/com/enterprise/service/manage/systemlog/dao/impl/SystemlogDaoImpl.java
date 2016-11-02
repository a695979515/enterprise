package com.enterprise.service.manage.systemlog.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.enterprise.core.dao.BaseDao;
import com.enterprise.page.PageModel;
import com.enterprise.service.manage.systemlog.bean.Systemlog;
import com.enterprise.service.manage.systemlog.dao.SystemlogDao;
@Repository("systemlogDaoManage")
public class SystemlogDaoImpl implements SystemlogDao{
	@Resource
	private BaseDao dao;
	

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	@Override
	public int insert(Systemlog e) {
		return dao.insert("manage.systemlog.insert", e);
	}

	@Override
	public int delete(Systemlog e) {
		return dao.delete("manage.systemlog.delete",e);
	}

	@Override
	public int update(Systemlog e) {
		return dao.update("manage.systemlog.update", e);
	}

	@Override
	public Systemlog selectOne(Systemlog e) {
		return (Systemlog) dao.selectOne("manage.systemlog.selectOne", e);
	}

	@Override
	public PageModel selectPageList(Systemlog e) {
		return dao.selectPageList("manage.systemlog.selectPageList", "manage.systemlog.selectPageCount", e);
	}

	@Override
	public List<Systemlog> selectList(Systemlog e) {
		return dao.selectList("manage.systemlog.selectList", e);
	}

	@Override
	public int deleteById(int id) {
		return dao.delete("manage.systemlog.deleteById", id);
	}

	@Override
	public Systemlog selectById(int id) {
		return (Systemlog) dao.selectOne("manage.systemlog.selectById", id);
	}

	@Override
	public Systemlog selectFirstOne(String account) {
		return (Systemlog) dao.selectOne("manage.systemlog.selectFirstOne", account);
	}

}
