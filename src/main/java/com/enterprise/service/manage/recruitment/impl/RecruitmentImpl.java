package com.enterprise.service.manage.recruitment.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.enterprise.core.ServersManage;
import com.enterprise.service.manage.recruitment.RecruitmentService;
import com.enterprise.service.manage.recruitment.bean.Recruitment;
import com.enterprise.service.manage.recruitment.dao.RecruitmentDao;
@Service("recruitmentServiceManage")
public class RecruitmentImpl extends ServersManage<Recruitment, RecruitmentDao> implements RecruitmentService{

	@Resource(name="recruitmentDaoManage")
	@Override
	public void setDao(RecruitmentDao dao) {
		this.dao = dao;
	}

}
