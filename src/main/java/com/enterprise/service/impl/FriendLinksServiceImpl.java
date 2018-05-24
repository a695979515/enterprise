package com.enterprise.service.impl;

import javax.annotation.Resource;

import com.enterprise.entity.FriendLinks;
import org.springframework.stereotype.Service;

import com.enterprise.dao.ServersManage;
import com.enterprise.service.FriendLinksService;
import com.enterprise.dao.FriendLinksDao;
@Service("friendLinksService")
public class FriendLinksServiceImpl extends ServersManage<FriendLinks, FriendLinksDao> implements FriendLinksService{

	@Resource(name="friendLinksDao")
	@Override
	public void setDao(FriendLinksDao dao) {
		this.dao = dao;
	}



}
