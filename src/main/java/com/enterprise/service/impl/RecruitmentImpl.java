package com.enterprise.service.impl;

import javax.annotation.Resource;

import com.enterprise.entity.Recruitment;
import org.springframework.stereotype.Service;

import com.enterprise.dao.ServersManage;
import com.enterprise.service.RecruitmentService;
import com.enterprise.dao.RecruitmentDao;
@Service("recruitmentService")
public class RecruitmentImpl extends ServersManage<Recruitment, RecruitmentDao> implements RecruitmentService{

	@Resource(name="recruitmentDao")
	@Override
	public void setDao(RecruitmentDao dao) {
		this.dao = dao;
	}

}
