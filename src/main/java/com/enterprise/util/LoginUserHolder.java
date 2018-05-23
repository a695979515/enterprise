package com.enterprise.util;

import javax.servlet.http.HttpSession;

import com.enterprise.entity.User;

/**
 * 验证session中用户是否还存在
 * @author Cesiumai
 *
 */
public class LoginUserHolder {
	public static User getLoginUser(){
		HttpSession session = RequestHolder.getSession();
		return session == null?null:(User)session.getAttribute("manage_session_user_info");
	}

	
}
