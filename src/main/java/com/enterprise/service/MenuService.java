package com.enterprise.service;

import com.enterprise.entity.Menu;
import com.enterprise.entity.MenuItem;
import com.enterprise.entity.User;
import java.util.*;


public interface MenuService extends Services<Menu>{

	List<Menu> selectList(Map<String, String> param);
	 int getCount(Menu menu);

	/**
	 * 根据菜单ID 删除菜单树勾选的借点，某个非叶子借点即便它下面的所有的叶子节点都呗勾选也不会被本次删除操作删除掉，
	 * 这样做是为了避免只想删除某个非叶子节点下面的所有子节点
	 * @param ids
	 * @param deleteParent 是否级联删除父菜单,在父菜单下的所有子菜单全部勾选的情况下,1:级联删除,-1不级联
	 * 	
	 */
	public void deletes(String ids,String deleteParent);
	/**
	 * 检查指定的菜单列表是否全部存在于另一个列表中
	 * @param idArr 待删除的菜单列表
	 * @param list	被检查的菜单列表
	 * @return  全部存在返回true   
	 */
	 boolean checkAllContains(String[] idArr,List<Menu> list);
	
	 boolean addOrUpdate(String updateP,Menu menu,Menu itemMenu);
	//加载根节点
	 List<MenuItem> loadMenus(User u, String pid, String url);
	 void loadChildrenByPid(MenuItem item, Menu menu,String url,User u);
	 Menu selectById(String id);
	
	
	
}
