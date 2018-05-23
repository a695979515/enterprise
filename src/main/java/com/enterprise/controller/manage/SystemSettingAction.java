package com.enterprise.controller.manage;

import javax.servlet.http.HttpServletRequest;

import com.enterprise.entity.SystemSetting;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.enterprise.cache.FrontCache;
import com.enterprise.service.Services;
import com.enterprise.service.SystemSettingService;
import com.enterprise.controller.BaseController;
/**
 * 系统设置
 * @author Cesiumai
 *
 */
@Controller
@RequestMapping("/manage/systemSetting/")
public class SystemSettingAction extends BaseController<SystemSetting>{
	private static final String page_toEdit = "/manage/systemsetting/systemSettingEdit";
	@Autowired
	private SystemSettingService systemSettingService;
	@Autowired
	private FrontCache frontCache;

	

	@Override
	public Services<SystemSetting> getService() {
		return systemSettingService;
	}



	/**
	 * 转到编辑界面
	 */
	@Override
	@RequestMapping("toEdit")
	public String toEdit(@ModelAttribute("e") SystemSetting e,ModelMap model) throws Exception{
		e = systemSettingService.selectOne(e);
		model.addAttribute("e", e);
		return page_toEdit;
	}
	/**
	 * 插入或者更新数据
	 * @param request
	 * @param e
	 * @param model
	 * @param flushAttrs
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="insertOrUpdate",method=RequestMethod.POST)
	public String insertOrUpdate(HttpServletRequest request, SystemSetting e, ModelMap model,RedirectAttributes flushAttrs) throws Exception{
		synchronized (this) {
			if(StringUtils.isBlank(e.getIsopen())){
				e.setIsopen("false");
			}
			if(e.getId()==0){
				insert(request, e, flushAttrs);
			}else{
				SystemSetting ss = systemSettingService.selectById(e.getId());
				if(ss ==null){
					throw new NullPointerException("根据id"+e.getId()+"找不到");
				}
				super.update(request, e, flushAttrs);
			}
			/**
			 * 更新后加载前台缓存
			 */
			frontCache.loadAllCache();
		}
		addMessage(flushAttrs, "更新成功!");
		return "redirect:toEdit";
	}


}
