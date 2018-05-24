package com.enterprise.controller.manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.enterprise.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.enterprise.entity.Menu;
import com.enterprise.entity.MenuItem;
import com.enterprise.entity.MenuType;
import com.enterprise.service.Services;
import com.enterprise.service.impl.MenuServiceImpl;
import com.enterprise.util.RequestHolder;
import com.enterprise.controller.BaseController;

import net.sf.json.JSONArray;

/**
 * 后台菜单管理
 * @author Cesiumai
 *
 */
@Controller
@RequestMapping("/manage/menu/")
public class MenuAction  extends BaseController<Menu>{
	private static final long serialVersionUID = 1L;
	@Autowired
	private MenuService menuService;
	
    private static final String page_toList = "/manage/system/menu/menuList";
    private static final String page_toEdit = "/manage/system/menu/editMenu";
    private static final String page_addOrUpdate = "/manage/system/menu/addOrUpdate";

    private MenuAction() {
        super.page_toList = page_toList;
        super.page_toEdit = page_toEdit;
        super.page_toAdd = page_toEdit;
    }
	@Override
	public Services<Menu> getService() {
		return menuService;
	}
	
	@RequestMapping("toAddOrUpdate")
	public String toAddOrUpdate(@ModelAttribute("e") Menu menu,ModelMap model) throws Exception{
		menu = menuService.selectOne(menu);
		model.addAttribute("e", menu);
		return page_addOrUpdate;
	}
	@RequestMapping("getMenusByPid")
	@ResponseBody
	public String getMenusByPid(HttpServletRequest request) throws Exception{
		String pid = request.getParameter("pid");
		if(pid ==null || pid.trim().equals("")){
			pid="0";
		}
		List<MenuItem> menus = menuService.loadMenus(null, pid, "#");
		return writeMenus(menus);
	}
	private String writeMenus(List<MenuItem> root) throws IOException{
		JSONArray json = JSONArray.fromObject(root);
		String jsonStr = json.toString();
		try{
			return jsonStr;
		}catch(Exception e){
			e.printStackTrace();
		}
		return jsonStr;
	}
	@RequestMapping(value="delete" ,method=RequestMethod.POST)
	@ResponseBody
	public String delete(HttpServletRequest request) throws Exception{
		String ids = request.getParameter("ids");
		if(ids==null || ids.trim().equals("")){
			throw new Exception("删除异常");
		}
		menuService.deletes(ids,request.getParameter("deleteParent"));
		return "1";
	}
	@RequestMapping(value="save",method=RequestMethod.POST)
	public String save(@ModelAttribute("e") Menu menu) throws Exception{
		if(menu.getId()==0){
			if(menu.getUrl()==null){
				menu.setUrl("");
			}
			menuService.insert(menu);
		}else{
			menuService.update(menu);
		}
		return selectList(RequestHolder.getRequest(), menu);
	}
	@RequestMapping(value = "addOrUpdate", method = RequestMethod.POST)
    @ResponseBody
	public String addOrUpdate(HttpServletRequest request) throws Exception{
		//选中菜单的信息
		String updateP = request.getParameter("updateP");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String orderNum = request.getParameter("orderNum");
		String type = request.getParameter("type");
		String icon = request.getParameter("icon");

		//要添加的子菜单
		String url = request.getParameter("url");
		String n_name = request.getParameter("n_name");
		String n_url = request.getParameter("n_url");
		String parentOrChild = request.getParameter("parentOrChild");
		String n_orderNum = request.getParameter("n_orderNum");
		String n_type = request.getParameter("n_type");
		
		Menu itemMenu = null;
		if(n_name!=null && !n_name.trim().equals("")){
			itemMenu = new Menu();
			//添加子菜单
			if(parentOrChild.equals("0")){//顶级模块
				itemMenu.setPid("0");
				itemMenu.setType(MenuType.module.toString());
			} else if(parentOrChild.equals("1")){//顶级页面
				itemMenu.setPid("0");
				itemMenu.setType(MenuType.page.toString());
			} else if(parentOrChild.equals("2")){//子模块
				itemMenu.setPid(id);
				itemMenu.setType(MenuType.module.toString());
			} else if(parentOrChild.equals("3")){//子页面
				itemMenu.setPid(id);
				itemMenu.setType(MenuType.page.toString());
			} else if(parentOrChild.equals("4")){   //功能
				itemMenu.setPid(id);
				itemMenu.setType(MenuType.button.toString());
			} else {
				throw new IllegalAccessException("添加菜单异常。");
			}
			itemMenu.setName(n_name);
			itemMenu.setUrl(n_url);
			itemMenu.setOrderNum(Integer.valueOf(n_orderNum));
			itemMenu.setType(n_type);
		}
		//修改父菜单
		Menu m = new Menu();
		m.setId(Integer.parseInt(id));
		m.setName(name);
		m.setUrl(url);
		m.setIcon(icon);
		m.setOrderNum(Integer.valueOf(orderNum));
		m.setType(type);
		menuService.addOrUpdate(updateP,m, itemMenu);
		
		return "ok";
	}

}
