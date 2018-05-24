package com.enterprise.entity;

import java.io.Serializable;

import com.enterprise.entity.page.PageModel;

/**
 * 后台菜单实体类
 */
public class Menu extends PageModel implements Serializable{


	private static final long serialVersionUID = 1L;
	private String pid;		//父id
	private String url;		//链接
	private String name;	//菜单名称
	private int orderNum;	//排序
	private String type;	//菜单类型
	private String icon;	//菜单图标
	
	public void clear(){
		super.clean();
		pid = null;
		url = null;
		name=null;
		orderNum=0;
		type=null;
		icon = null;
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

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	@Override
	public String toString() {
		return "Menu{" +
				"pid='" + pid + '\'' +
				", url='" + url + '\'' +
				", name='" + name + '\'' +
				", orderNum=" + orderNum +
				", type='" + type + '\'' +
				", icon='" + icon + '\'' +
				'}';
	}
}
