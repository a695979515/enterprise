package com.enterprise.controller.manage;

import com.enterprise.entity.Systemlog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.enterprise.service.Services;
import com.enterprise.entity.page.PageModel;
import com.enterprise.service.SystemlogService;
import com.enterprise.controller.BaseController;
/**
 * 系统日志管理
 * @author Cesiumai
 *
 */
@Controller
@RequestMapping("/manage/systemlog/")
public class SystemlogAction extends BaseController<Systemlog>{
	private static final String page_toList = "/manage/systemlog/systemlogList";
	@Autowired
	private SystemlogService systemlogService;

	public  SystemlogAction() {
		super.page_toList = page_toList;
	}
	@Override
	public Services<Systemlog> getService() {
		return systemlogService;
	}

	public void setSystemlogService(SystemlogService systemlogService) {
		this.systemlogService = systemlogService;
	}


	@Override
	public void insertAfter(Systemlog e){
		e.clear();
	}
	@Override
	protected void selectListAfter(PageModel pager) {
		pager.setPagerUrl("selectList");
	}
	
	


}
