package com.enterprise.controller.manage;


import com.enterprise.entity.Messages;
import com.enterprise.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.enterprise.service.Services;
import com.enterprise.controller.BaseController;
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
