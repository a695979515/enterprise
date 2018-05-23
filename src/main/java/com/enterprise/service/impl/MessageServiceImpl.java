package com.enterprise.service.impl;

import javax.annotation.Resource;

import com.enterprise.entity.Messages;
import com.enterprise.service.MessageService;
import org.springframework.stereotype.Service;

import com.enterprise.dao.ServersManage;
import com.enterprise.dao.MessageDao;

@Service("messageService")
public class MessageServiceImpl extends ServersManage<Messages, MessageDao> implements MessageService {

	@Resource(name="messageDao")
	@Override
	public void setDao(MessageDao dao) {
		this.dao = dao;
	}

}
