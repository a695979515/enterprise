package com.enterprise.service;

import com.enterprise.entity.User;

public interface UserService extends Services<User>{

	public User login(User e);
}
