package com.enterprise.web.action.manage.messages;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.enterprise.core.Services;
import com.enterprise.service.manage.messages.MessageService;
import com.enterprise.service.manage.messages.bean.Messages;
import com.enterprise.web.action.BaseController;
/**
 * 后台查看留言管理
 * @author Cesiumai
 *
 */
@Controller
@RequestMapping("/manage/message/")
public class MessagesAction extends BaseController<Messages>{
	private static final String page_toList = "/manage/messages/messageList";
	private static final String page_toEdit = "/manage/messages/messageInfo";
	public MessagesAction() {
		super.page_toList = page_toList;
		super.page_toEdit = page_toEdit;
	}
	
	@Autowired
	private MessageService messageService;

	@Override
	public Services<Messages> getService() {
		return messageService;
	}


}
