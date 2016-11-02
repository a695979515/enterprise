package com.enterprise.service.manage.system;

import com.enterprise.common.User;
import com.enterprise.core.Services;

public interface UserInteface extends Services<User>{

	public User login(User e);
}
