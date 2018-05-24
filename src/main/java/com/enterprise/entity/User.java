package com.enterprise.entity;

import java.io.Serializable;

import com.enterprise.entity.page.PageModel;

public class User extends PageModel implements Serializable {
	private String username;	//用户名
	private String password;	//密码
	private String createtime;	//创建时间
	private String updatetime;	//更新时间
	private String createAccount;//创建用户
	private String updateAccount;//更新用户
	private String email;		//邮件
	private String newpassword;	//新密码1   用于修改密码
	private String newpassword2;//新密码2   用于修改密码
	private String nickname;	//管理员名称
	private String oldPassword;	//原始密码
	private String manage_vcode;//验证码
	private String portrait;	//头像


	public void clear() {
		username = null;
		password = null;
		createtime = null;
		updatetime = null;
		createAccount = null;
		updateAccount = null;
		email = null;
		newpassword = null;
		newpassword2 = null;
		nickname = null;
		oldPassword = null;
		manage_vcode = null;
		portrait = null;
	}


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}

	public String getCreateAccount() {
		return createAccount;
	}

	public void setCreateAccount(String createAccount) {
		this.createAccount = createAccount;
	}

	public String getUpdateAccount() {
		return updateAccount;
	}

	public void setUpdateAccount(String updateAccount) {
		this.updateAccount = updateAccount;
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public String getNewpassword2() {
		return newpassword2;
	}

	public void setNewpassword2(String newpassword2) {
		this.newpassword2 = newpassword2;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getManage_vcode() {
		return manage_vcode;
	}

	public void setManage_vcode(String manage_vcode) {
		this.manage_vcode = manage_vcode;
	}

	public String getPortrait() {
		return portrait;
	}

	public void setPortrait(String portrait) {
		this.portrait = portrait;
	}

	@Override
	public String toString() {
		return "User{" +
				", username='" + username + '\'' +
				", password='" + password + '\'' +
				", createtime='" + createtime + '\'' +
				", updatetime='" + updatetime + '\'' +
				", createAccount='" + createAccount + '\'' +
				", updateAccount='" + updateAccount + '\'' +
				", email='" + email + '\'' +
				", newpassword='" + newpassword + '\'' +
				", newpassword2='" + newpassword2 + '\'' +
				", nickname='" + nickname + '\'' +
				", oldPassword='" + oldPassword + '\'' +
				'}';
	}
}
