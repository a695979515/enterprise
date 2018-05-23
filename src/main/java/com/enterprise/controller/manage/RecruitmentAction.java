package com.enterprise.controller.manage;


import javax.servlet.http.HttpServletRequest;

import com.enterprise.cache.FrontCache;
import com.enterprise.entity.Recruitment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.enterprise.entity.User;
import com.enterprise.service.Services;
import com.enterprise.service.RecruitmentService;
import com.enterprise.util.LoginUserHolder;
import com.enterprise.controller.BaseController;
/**
 * 后台发布招聘
 * @author Cesiumai
 *
 */
@Controller
@RequestMapping("/manage/recruitment/")
public class RecruitmentAction extends BaseController<Recruitment>{

	private static final String page_toList = "/manage/recruitment/recruitmentList";
	private static final String page_toEdit = "/manage/recruitment/recruitmentEdit";
	private static final String page_toAdd = "/manage/recruitment/recruitmentEdit";
	public RecruitmentAction() {
		super.page_toList = page_toList;
		super.page_toEdit = page_toEdit;
		super.page_toAdd = page_toAdd;
	}
	@Autowired
	private RecruitmentService recruitmentService;
	@Autowired
	private FrontCache frontCache;
	@Override
	public Services<Recruitment> getService() {
		return recruitmentService;
	}
	
	/**
	 * 添加招聘信息
	 */
	@Override
	public String insert(HttpServletRequest request, Recruitment e, RedirectAttributes flushAttrs) throws Exception {
		User u = LoginUserHolder.getLoginUser();
		e.setCreateAccount(u.getUsername());
		//获取到发布招聘的用户名称
		recruitmentService.insert(e);
		insertAfter(e);
		//加载招聘信息缓存
		frontCache.loadRecruitments();
		addMessage(flushAttrs,"操作成功！");
		return "redirect:selectList";
	}
	/**
	 * 更新招聘信息
	 * @param request
	 * @param e
	 * @param flushAttrs
	 * @return
     * @throws Exception
     */
	@Override
	public String update(HttpServletRequest request, @ModelAttribute("e") Recruitment e, RedirectAttributes flushAttrs) throws Exception {
		recruitmentService.update(e);
		insertAfter(e);
		//加载招聘信息缓存
		frontCache.loadRecruitments();
		addMessage(flushAttrs, "操作成功！");
		return "redirect:selectList";
	}
	/**
	 * 更新状态为显示
	 * @param ids
	 * @param flushAttrs
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("updateStatusY")
	public String updateStatusY(String[] ids, RedirectAttributes flushAttrs) throws Exception{
		Recruitment e;
		for(int i=0;i<ids.length;i++){
			e = new Recruitment();
			e.setId(Integer.parseInt(ids[i]));
			e.setStatus("y");
			recruitmentService.update(e);
		}
		//加载招聘信息缓存
		frontCache.loadRecruitments();
		addMessage(flushAttrs, "操作成功!");
		return "redirect:selectList";
	}
	/**
	 * 更新状态为不显示
	 * @param ids
	 * @param flushAttrs
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("updateStatusN")
	public String updateStatusN(String[] ids, RedirectAttributes flushAttrs) throws Exception{
		Recruitment e;
		for(int i=0;i<ids.length;i++){
			e = new Recruitment();
			e.setId(Integer.parseInt(ids[i]));
			e.setStatus("n");
			recruitmentService.update(e);
		}
		//加载招聘信息缓存
		frontCache.loadRecruitments();
		addMessage(flushAttrs, "操作成功!");
		return "redirect:selectList";
	}
	/**
	 * 批量删除
	 * @param request
	 * @param ids
	 * @param recruitment
	 * @param flushAttrs
	 * @return
     * @throws Exception
     */
	@Override
	public String deletes(HttpServletRequest request, String[] ids, @ModelAttribute("e") Recruitment recruitment, RedirectAttributes flushAttrs) throws Exception {
		recruitmentService.deletes(ids);
		//加载招聘信息缓存
		frontCache.loadRecruitments();
		addMessage(flushAttrs,"操作成功！");
		return "redirect:selectList";
	}
}
