package com.enterprise.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import com.enterprise.entity.Recruitment;
import org.springframework.stereotype.Repository;

import com.enterprise.dao.BaseDao;
import com.enterprise.entity.page.PageModel;
import com.enterprise.dao.RecruitmentDao;


@Repository("recruitmentDao")
public class RecruitmentDaoImpl implements RecruitmentDao{

	@Resource
	private BaseDao dao;
	
	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	@Override
	public int insert(Recruitment e) {
		return dao.insert("recruitment.insert", e);
	}

	@Override
	public int delete(Recruitment e) {
		return dao.delete("recruitment.delete", e);
	}
	

	@Override
	public int update(Recruitment e) {
		return dao.update("recruitment.update", e);
	}

	@Override
	public Recruitment selectOne(Recruitment e) {
		return (Recruitment) dao.selectOne("recruitment.selectOne", e);
	}

	@Override
	public PageModel selectPageList(Recruitment e) {
		return dao.selectPageList("recruitment.selectPageList", "recruitment.selectPageCount", e);
	}

	@Override
	public List<Recruitment> selectList(Recruitment e) {
		return dao.selectList("recruitment.selectList", e);
	}

	@Override
	public int deleteById(int id) {
		return dao.delete("recruitment.deleteById",id);
	}

	@Override
	public Recruitment selectById(int id) {
		return (Recruitment) dao.selectOne("recruitment.selectById",id);
	}

}
