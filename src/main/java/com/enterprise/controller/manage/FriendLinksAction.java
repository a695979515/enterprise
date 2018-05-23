package com.enterprise.controller.manage;

import com.enterprise.cache.FrontCache;
import com.enterprise.entity.FriendLinks;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.enterprise.service.Services;
import com.enterprise.service.FriendLinksService;
import com.enterprise.controller.BaseController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * 友情链接Action
 */
@Controller
@RequestMapping("/manage/friendLinks/")
public class FriendLinksAction extends BaseController<FriendLinks>{

	private static final String page_toEdit = "/manage/friendLinks/friendLinksEdit";
	private static final String page_toAdd = "/manage/friendLinks/friendLinksEdit";
	private static final String page_toList = "/manage/friendLinks/friendLinksList";
	public FriendLinksAction() {
		super.page_toAdd = page_toAdd;
		super.page_toEdit = page_toEdit;
		super.page_toList = page_toList;
	}
	@Autowired
	private FriendLinksService friendLinksService;
	@Autowired
	private FrontCache frontCache;
	
	@Override
	public Services<FriendLinks> getService() {
		return friendLinksService;
	}


	/**
	 * 更新
	 * @param request
	 * @param e
	 * @param flushAttrs
	 * @return
     * @throws Exception
     */
	@Override
	public String update(HttpServletRequest request, @ModelAttribute("e") FriendLinks e, RedirectAttributes flushAttrs) throws Exception {
		friendLinksService.update(e);
		insertAfter(e);
		//更新成功后更新缓存
		frontCache.loadFriendLinks();
		addMessage(flushAttrs, "操作成功！");
		return "redirect:selectList";
	}


	/**
	 * 插入
	 * @param request
	 * @param e
	 * @param flushAttrs
	 * @return
     * @throws Exception
     */
	@Override
	public String insert(HttpServletRequest request, @ModelAttribute("e") FriendLinks e, RedirectAttributes flushAttrs) throws Exception {
		friendLinksService.insert(e);
		insertAfter(e);
		//插入成功后更新缓存
		frontCache.loadFriendLinks();
		addMessage(flushAttrs,"操作成功！");
		return "redirect:selectList";
	}


}
