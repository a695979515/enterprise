package com.enterprise.entity;

import java.io.Serializable;

import com.enterprise.entity.page.PageModel;

/**
 * 友情链接实体类
 */
public class FriendLinks extends PageModel implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String name;		//链接名称
	private String target;		//打开链接方式
	private String url;			//链接地址
	
	public void clear(){
		super.clean();
		name = null;
		target = null ;
		url = null;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	

}
