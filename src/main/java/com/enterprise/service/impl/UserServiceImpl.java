package com.enterprise.service.impl;

import java.util.List;


import com.enterprise.service.UserService;
import org.springframework.stereotype.Service;

import com.enterprise.entity.User;
import com.enterprise.dao.BaseDao;
import com.enterprise.entity.page.PageModel;

import javax.annotation.Resource;


/**
 * 用户业务逻辑实现类
 * 
 * @author huangf
 * 
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
	private BaseDao dao;

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public User login(User user) {
//		user.setStatus(User.user_status_y);
		return (User) dao.selectOne("user.selectOne", user);
	}

	public List selectList(User user) {
		if (user == null)
			return dao.selectList("user.selectList");
		return dao.selectList("user.selectList", user);
	}

	public int insert(User user) {
		return dao.insert("user.insert", user);
	}

	/**
	 * 批量删除用户
	 * 
	 * @param ids
	 */
	public int deletes(String[] ids) {
		User user = new User();
		for (int i = 0; i < ids.length; i++) {
			user.setId(Integer.parseInt(ids[i]));
			delete(user);
		}
		return 0;
	}

	public int delete(User e) {
		return dao.delete("user.delete", e);
	}

	public int update(User e) {
		return dao.update("user.update", e);
	}

	public PageModel selectPageList(User e) {
		return dao.selectPageList("user.selectPageList",
				"user.selectPageCount", e);
	}

	@Override
	public User selectOne(User e) {
		return (User) dao.selectOne("user.selectOne", e);
	}

	@Override
	public User selectById(int id) {
		User user = new User();
		user.setId(id);
		return selectOne(user);
	}
	
	/**
	 * 根据条件查询数量
	 * @param user
	 * @return
	 */
	public int selectCount(User user) {
		if(user==null){
			throw new NullPointerException();
		}
		
		return (Integer) dao.selectOne("user.selectCount",user);
	}

	public User selectOneByCondition(User user) {
		if(user==null){
			throw new NullPointerException();
		}
		return (User) dao.selectOne("user.selectOneByCondition", user);
	}

}
