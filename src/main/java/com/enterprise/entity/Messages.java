package com.enterprise.entity;

import java.io.Serializable;

import com.enterprise.entity.page.PageModel;

/**
 * 留言实体类
 * @author Cesiumai
 *
 */
public class Messages extends PageModel implements Serializable{

	private static final long serialVersionUID = 1L;

	private String title;	//留言标题
	private String name;	//留言人名字
	private String gender;	//留言人性别 ：女f、男m
	private String tel;		//留言人电话
	private String email;	//留言人email
	private String content;	//留言内容
	private String leavetime;//留言时间
	private String vcode;	//验证码
	
	public void clean() {
		super.clean();
		title = null;
		name = null;
		gender = null;
		tel = null;
		email = null;
		content = null;
		leavetime = null;
		vcode = null;
	}


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLeavetime() {
		return leavetime;
	}

	public void setLeavetime(String leavetime) {
		this.leavetime = leavetime;
	}

	public String getVcode() {
		return vcode;
	}

	public void setVcode(String vcode) {
		this.vcode = vcode;
	}


	
	
	
	
	
}
