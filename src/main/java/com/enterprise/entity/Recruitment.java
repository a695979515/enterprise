package com.enterprise.entity;

import java.io.Serializable;

import com.enterprise.entity.page.PageModel;
/**
 * 招聘实体类
 * @author Cesiumai
 *
 */
public class Recruitment extends PageModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String position;		//职位
	private String nature;			//工作性质
	private int number;				//人数
	private String education;		//学历
	private int experience;		//工作经验
	private String requirements;			//任职要求
	private String createtime;		//创建时间
	private String createAccount;	//创建的账户
	private String status;			//状态
	
	@Override
	public void clean() {
		super.clean();
		position = null;
		nature  = null;
		number = 0;
		education = null;
		experience = 0;
		requirements = null;
		createtime = null;
		createAccount = null;
		status = null;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getNature() {
		return nature;
	}

	public void setNature(String nature) {
		this.nature = nature;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	

	public int getExperience() {
		return experience;
	}

	public void setExperience(int experience) {
		this.experience = experience;
	}

	public String getrequirements() {
		return requirements;
	}

	public void setrequirements(String requirements) {
		this.requirements = requirements;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getCreateAccount() {
		return createAccount;
	}

	public void setCreateAccount(String createAccount) {
		this.createAccount = createAccount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	

}
