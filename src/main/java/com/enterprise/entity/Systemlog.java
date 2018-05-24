package com.enterprise.entity;

import java.io.Serializable;

import com.enterprise.entity.page.PageModel;

/**
 * 系统日志实体类
 */
public class Systemlog extends PageModel implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String title;	//标题
	private String content;	//内容
	private String account;	//操作用户名
	private int type;		//类型
	private String loginIp;	//操作IP
	private String logintime;//操作时间
	private String loginArea;//操作地址
	private String diffAreaLogin;//是否为异地
	
	public static final String systemlog_diffAreaLogin_y ="y";//是
	public static final String systemlog_diffAreaLogin_n ="n";//否
	
	public void clear(){
		super.clean();
		title = null;
		content = null;
		account = null;
		type=0;
		loginIp = null;
		loginArea = null;
		diffAreaLogin = null;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public String getLogintime() {
		return logintime;
	}

	public void setLogintime(String logintime) {
		this.logintime = logintime;
	}

	public String getLoginArea() {
		return loginArea;
	}

	public void setLoginArea(String loginArea) {
		this.loginArea = loginArea;
	}

	public String getDiffAreaLogin() {
		return diffAreaLogin;
	}

	public void setDiffAreaLogin(String diffAreaLogin) {
		this.diffAreaLogin = diffAreaLogin;
	}
	
	
	
}
