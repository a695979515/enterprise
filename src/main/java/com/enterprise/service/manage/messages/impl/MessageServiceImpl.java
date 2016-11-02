package com.enterprise.service.manage.messages.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.enterprise.core.DaoManage;
import com.enterprise.core.ServersManage;
import com.enterprise.service.manage.messages.MessageService;
import com.enterprise.service.manage.messages.bean.Messages;
import com.enterprise.service.manage.messages.dao.MessageDao;

@Service("messageServiceManage")
public class MessageServiceImpl extends ServersManage<Messages, MessageDao> implements MessageService{

	@Resource(name="messageDaoManage")
	@Override
	public void setDao(MessageDao dao) {
		this.dao = dao;
	}

}
