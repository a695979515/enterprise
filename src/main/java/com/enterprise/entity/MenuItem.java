package com.enterprise.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * 菜单遍历实体类
 */
public class MenuItem{
	private String id;	//id
	private String pid;	//父id
	private String url;	//链接
	private String name;//菜单名称
	private String icon;//图标
	private boolean open = false;
	private boolean checked;
	private List<MenuItem> children;	//子菜单集合
	private MenuType type = MenuType.module;
	
	
	
	
	public MenuItem(String name, List<MenuItem> children) {
		super();
		this.name = name;
		this.children = children;
	}

	/**
	 * 是否是按钮
	 * @return
     */
	public boolean isButton(){
		if(this.type!=null && this.type.equals(MenuType.button)){
			return true;
		}
		return false;
	}

	/**
	 * 是否是根目录菜单
	 * @return
     */
	public boolean isRootMenu(){
		return "0".equals(pid);
	}
	public void addChildren(MenuItem item){
		if(children ==null){
			children = new ArrayList<MenuItem>();
		}
		children.add(item);
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isOpen() {
		return open;
	}
	public void setOpen(boolean open) {
		this.open = open;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public List<MenuItem> getChildren() {
		return children;
	}
	public void setChildren(List<MenuItem> children) {
		this.children = children;
	}
	public MenuType getType() {
		return type;
	}
	public void setType(MenuType type) {
		this.type = type;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}
}
