package com.enterprise.service.front.messages.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.enterprise.core.ServersManage;
import com.enterprise.service.front.messages.MessageService;
import com.enterprise.service.front.messages.bean.Messages;
import com.enterprise.service.front.messages.dao.MessageDao;

@Service("messageServiceFront")
public class MessageServiceImpl extends ServersManage<Messages, MessageDao> implements MessageService{

	@Resource(name="messageDaoFront")
	@Override
	public void setDao(MessageDao dao) {
		this.dao = dao;
	}

}
