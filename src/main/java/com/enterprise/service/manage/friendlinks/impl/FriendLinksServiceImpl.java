package com.enterprise.service.manage.friendlinks.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.enterprise.core.ServersManage;
import com.enterprise.service.manage.friendlinks.FriendLinksService;
import com.enterprise.service.manage.friendlinks.bean.FriendLinks;
import com.enterprise.service.manage.friendlinks.dao.FriendLinksDao;
@Service("friendLinksServiceManage")
public class FriendLinksServiceImpl extends ServersManage<FriendLinks, FriendLinksDao> implements FriendLinksService{

	@Resource(name="friendLinksDaoManage")
	@Override
	public void setDao(FriendLinksDao dao) {
		this.dao = dao;
	}



}
