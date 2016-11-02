package com.enterprise.service.manage.recruitment.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.enterprise.core.dao.BaseDao;
import com.enterprise.page.PageModel;
import com.enterprise.service.manage.recruitment.bean.Recruitment;
import com.enterprise.service.manage.recruitment.dao.RecruitmentDao;


@Repository("recruitmentDaoManage")
public class RecruitmentDaoImpl implements RecruitmentDao{

	@Resource
	private BaseDao dao;
	
	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	@Override
	public int insert(Recruitment e) {
		return dao.insert("manage.recruitment.insert", e);
	}

	@Override
	public int delete(Recruitment e) {
		return dao.delete("manage.recruitment.delete", e);
	}
	

	@Override
	public int update(Recruitment e) {
		return dao.update("manage.recruitment.update", e);
	}

	@Override
	public Recruitment selectOne(Recruitment e) {
		return (Recruitment) dao.selectOne("manage.recruitment.selectOne", e);
	}

	@Override
	public PageModel selectPageList(Recruitment e) {
		return dao.selectPageList("manage.recruitment.selectPageList", "manage.recruitment.selectPageCount", e);
	}

	@Override
	public List<Recruitment> selectList(Recruitment e) {
		return dao.selectList("manage.recruitment.selectList", e);
	}

	@Override
	public int deleteById(int id) {
		return dao.delete("manage.recruitment.deleteById",id);
	}

	@Override
	public Recruitment selectById(int id) {
		return (Recruitment) dao.selectOne("manage.recruitment.selectById",id);
	}

}
