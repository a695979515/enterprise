package com.enterprise.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.enterprise.service.MenuService;
import org.springframework.stereotype.Service;

import com.enterprise.entity.Menu;
import com.enterprise.entity.MenuItem;
import com.enterprise.entity.MenuType;
import com.enterprise.entity.User;
import com.enterprise.service.Services;
import com.enterprise.dao.BaseDao;
import com.enterprise.entity.page.PageModel;

@Service("menuService")
public class MenuServiceImpl implements MenuService {
	@Resource
	private BaseDao dao;
	

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	@Override
	public int insert(Menu e) {
		return dao.insert("menu.insert", e);
	}

	@Override
	public int delete(Menu e) {
		return dao.delete("menu.delete", e);
	}

	@Override
	public int deletes(String[] ids) {
		return 0;
	}

	@Override
	public int update(Menu e) {
		return dao.update("menu.update", e);
	}

	@Override
	public Menu selectOne(Menu e) {
		return (Menu) dao.selectOne("menu.selectOne", e);
	}

	@Override
	public Menu selectById(int id) {
		return (Menu) dao.selectOne(String.valueOf(id));
	}

	@Override
	public PageModel selectPageList(Menu e) {
		return null;
	}

	@Override
	public List<Menu> selectList(Menu e) {
		return dao.selectList("menu.selectMenus",e);
	}
	public List<Menu> selectList(Map<String, String> param) {
		if(param==null){
			return dao.selectList("menu.selectList");
		} 
		return dao.selectList("menu.selectMenus",param);
	}
	public int getCount(Menu menu) {
		return dao.getCount("menu.getCount", menu);
	}

	/**
	 * 根据菜单ID 删除菜单树勾选的借点，某个非叶子借点即便它下面的所有的叶子节点都呗勾选也不会被本次删除操作删除掉，
	 * 这样做是为了避免只想删除某个非叶子节点下面的所有子节点
	 * @param ids
	 * @param deleteParent 是否级联删除父菜单,在父菜单下的所有子菜单全部勾选的情况下,1:级联删除,-1不级联
	 * 	
	 */
	public void deletes(String ids,String deleteParent){
		String[] idArr = ids.split(",");
		Arrays.sort(idArr,new Comparator<String>(){

			@Override
			public int compare(String o1, String o2) {
				int a1 = Integer.parseInt(o1);
				int a2 = Integer.parseInt(o2);
				if(a1>a2){
					return 1;
				}else if(a1<a2){
					return -1;
				}
				return 0;
			}
		});
		Menu menu = new Menu();
		if(deleteParent.equals("-1")){
			for(int i = 0; i<idArr.length;i++){
				menu.clean();
				menu.setPid(idArr[i]);
				if(this.getCount(menu)==0){
					menu.clean();
					menu.setId(Integer.parseInt(idArr[i]));
					this.delete(menu);
				}
			}
		}else if(deleteParent.equals("1")){
			for(int i = idArr.length-1;i>=0;i--){
				menu.clean();
				menu.setPid(idArr[i]);
				if(this.getCount(menu)==0){
					menu.clean();
					menu.setId(Integer.parseInt(idArr[i]));
					this.delete(menu);
				}else{
					menu.clean();
					menu.setPid(idArr[i]);
					List<Menu> menus = this.selectList(menu);
					if(menus != null && menus.size()>0){
						if(checkAllContains(idArr,menus)){
							this.delete(menu);
						}
					}
				}
			}
		}else{
			throw new NullPointerException("deleteParent:"+deleteParent);
		}
	}
	/**
	 * 检查指定的菜单列表是否全部存在于另一个列表中
	 * @param idArr 待删除的菜单列表
	 * @param list	被检查的菜单列表
	 * @return  全部存在返回true   
	 */
	public boolean checkAllContains(String[] idArr,List<Menu> list){
		int n = list.size();
		for(int i = 0; i<list.size();i++){
			for(int j = 0; j<idArr.length;j++){
				if(String.valueOf(list.get(i).getId()).equals(idArr[j])){
					n--;
					break;
				}
			}
		}
		return 0==0?true:false;
	}
	
	public boolean addOrUpdate(String updateP,Menu menu,Menu itemMenu){
		if(itemMenu!=null){
			insert(itemMenu);
		}
		update(menu);
		return true;
	}
	//加载根节点
	public List<MenuItem> loadMenus(User u, String pid, String url) {
		Map<String, String> param = new HashMap<String, String>();

		param.put("pid", pid);// 菜单父ID
		List<Menu> menus = dao.selectList("menu.selectMenus", param);
		// 创建菜单集合
		List<MenuItem> root = new ArrayList<MenuItem>();
		// 循环添加菜单到菜单集合
//		for (Iterator<Menu> it = menus.iterator(); it.hasNext();) {
		for(int i=0;i<menus.size();i++){
//			Menu entry = it.next();
			Menu menu = menus.get(i);
			MenuItem item = new MenuItem(menu.getName(), null);
			item.setId(String.valueOf(menu.getId()));
			item.setPid(menu.getPid());
			if (url != null) {
				item.setUrl(url);
			} else {
				item.setUrl(menu.getUrl());
			}
			root.add(item);
		}
		// 加载子菜单，注意 只加载type为模块级或页面级的
		for (int i = 0; i < root.size(); i++) {
			MenuItem ee = root.get(i);
			if(ee.getType()==null || ee.getType().toString().equals("") || ee.getType().equals(MenuType.button)){
				continue;
			}
			
			Menu mm = new Menu();
			mm.setPid(ee.getId());
			loadChildrenByPid(ee, mm, url, u);
		}

		return root;
	}
	public void loadChildrenByPid(MenuItem item, Menu menu,String url,User u){
		Map<String ,String> param = new HashMap<String, String>();

		param.put("pid", menu.getPid());
		
		List<Menu> data = dao.selectList("menu.selectMenus", param);
		if(data == null || data.size()==0){
			return;
		}
		if(item.getChildren()==null){
			item.setChildren(new ArrayList<MenuItem>());
		}
		for(int i =0 ; i< data.size();i++){
			Menu entry = data.get(i);
			MenuItem addItem = new MenuItem(entry.getName(), null);
			addItem.setId(String.valueOf(entry.getId()));
			addItem.setPid(entry.getPid());
			if(url !=null){
				addItem.setUrl(url);
			}else{
				addItem.setUrl(entry.getUrl());
			}
			item.getChildren().add(addItem);
		}
		for(int i=0;i<item.getChildren().size();i++){
			Menu itemMenu = new Menu();
			itemMenu.setPid(item.getChildren().get(i).getId());
			loadChildrenByPid(item.getChildren().get(i),itemMenu,url,u);
		}
	}
	
	public Menu selectById(String id) {
		return (Menu) dao.selectOne(id);
	}
	
	
	
}
