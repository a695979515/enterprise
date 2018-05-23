package com.enterprise.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.enterprise.service.Services;
import com.enterprise.core.SystemManage;
import com.enterprise.entity.page.PageModel;
import com.enterprise.util.RequestHolder;
/**
 * 抽象控制类
 * @author Cesiumai
 *
 * @param <E>
 */
public abstract class BaseController<E extends PageModel> {

	protected String page_toList = null;
	protected String page_toEdit = null;
	protected String page_toAdd = null;
	
	public abstract Services<E> getService();
	
	@Autowired
	protected SystemManage systemManage;
	/**
	 * 后台左边导航菜单的初始化查询方法
	 */
	protected void initPageSelect(){
		
	}
	
	protected void setParamWhenInitQuery(E e){
		
	}

	/**
	 * 查询列表
	 * @param request
	 * @param e
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("selectList")
	public String selectList(HttpServletRequest request,@ModelAttribute("e") E e) throws Exception{
		this.initPageSelect();
		setParamWhenInitQuery(e);
		int offset = 0;
		if(request.getParameter("pager.offset")!=null){
			offset = Integer.parseInt(request.getParameter("pager.offset"));
		}
		if(offset < 0){
			offset=0;
		}
		e.setOffset(offset);
		PageModel page = getService().selectPageList(e);
		if(page == null){
			page = new PageModel();
		}
		page.setPagerSize((page.getTotal() + page.getPageSize() - 1)
	                / page.getPageSize());
		selectListAfter(page);
		request.setAttribute("pager", page);
		return page_toList;
	}
	/**
	 * 分页查询设置pagerurl
	 * @param page
	 */
	protected void selectListAfter(PageModel page){
		page.setPagerUrl("selectList");
	}
	/**
	 * 转到编辑页面	
	 * @param e
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("toEdit")
	public String toEdit(@ModelAttribute("e") E e , ModelMap model) throws Exception{
		e = getService().selectOne(e);
		model.addAttribute("e", e);
		return page_toEdit;
	}
	/**
	 * 转到添加页面
	 * @param e
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("toAdd")
	public String toAdd(@ModelAttribute("e") E e,ModelMap model) throws Exception{
		e.clean();
		return page_toAdd;
	}
	/**
	 * 回到查询页面
	 * @param e
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("back")
	public String back(@ModelAttribute("e") E e,ModelMap model) throws Exception{
		return selectList(RequestHolder.getRequest(), e);
	}
	/**
	 * 批量删除
	 * @param request
	 * @param ids
	 * @param e
	 * @param flushAttrs
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="deletes",method = RequestMethod.POST)
	public String deletes(HttpServletRequest request,String[] ids,@ModelAttribute("e") E e,RedirectAttributes flushAttrs) throws Exception{
		getService().deletes(ids);
		addMessage(flushAttrs,"操作成功！");
		return "redirect:selectList";
	}
	/**
	 *  insert之后，selectList之前执行的动作，一般需要清除添加的E，否则查询会按照E的条件进行查询.
     * 	部分情况下需要保留某些字段，可以选择不清除
	 * @param e
	 */
	protected void insertAfter(E e){
		
	}
	/**
	 * 插入数据
	 * @param request
	 * @param e
	 * @param flushAttrs
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="insert",method=RequestMethod.POST)
	public String insert(HttpServletRequest request , @ModelAttribute("e") E e,RedirectAttributes flushAttrs) throws Exception{
		getService().insert(e);
		insertAfter(e);
		addMessage(flushAttrs,"操作成功！");
		return "redirect:selectList";
	}
	/**
	 * 更新数据
	 * @param request
	 * @param e
	 * @param flushAttrs
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(HttpServletRequest request, @ModelAttribute("e") E e, RedirectAttributes flushAttrs) throws Exception {

        getService().update(e);
        insertAfter(e);
        addMessage(flushAttrs, "操作成功！");
        return "redirect:selectList";
    }
	/**
	 * datatable异步请求数据
	 * @param request
	 * @param e
	 * @return
	 */
	@RequestMapping("loadData")
	@ResponseBody
	public PageModel loadData(HttpServletRequest request, E e){
		int offset = 0;
		int pageSize = 10;
		if(request.getParameter("start")!=null){
			offset = Integer.parseInt(request.getParameter("start"));
		}
		if(request.getParameter("length")!=null){
			pageSize = Integer.parseInt(request.getParameter("length"));
		}
		if(offset<0){
			offset=0;
		}
		if(pageSize<0){
			pageSize=10;
		}
		e.setOffset(offset);
		e.setPagerSize(pageSize);
		PageModel page = getService().selectPageList(e);
		page.setRecordsTotal(page.getTotal());
		page.setRecordsFiltered(page.getTotal());
		return page;
	}
	
	protected void addMessage(ModelMap modelMap ,String message){
		modelMap.addAttribute("message", message);
	}
	protected void addWarning(ModelMap modelMap ,String message){
		modelMap.addAttribute("warning", message);
	}
	protected void addEroor(ModelMap modelMap ,String message){
		modelMap.addAttribute("errorMsg", message);
	}
	protected void addMessage(RedirectAttributes flushAttrs,String message){
		flushAttrs.addFlashAttribute("message", message);
	}
	protected void addWarning(RedirectAttributes flushAttrs,String message){
		flushAttrs.addFlashAttribute("warning", message);
	}
	protected void addError(RedirectAttributes flushAttrs,String message){
		flushAttrs.addFlashAttribute("errorMsg", message);
	}
}
