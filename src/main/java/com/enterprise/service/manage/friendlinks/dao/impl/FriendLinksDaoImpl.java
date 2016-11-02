package com.enterprise.service.manage.friendlinks.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.enterprise.core.dao.BaseDao;
import com.enterprise.page.PageModel;
import com.enterprise.service.manage.friendlinks.bean.FriendLinks;
import com.enterprise.service.manage.friendlinks.dao.FriendLinksDao;
@Repository("friendLinksDaoManage")
public class FriendLinksDaoImpl implements FriendLinksDao{

	@Resource
	private BaseDao dao;
	
	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	@Override
	public int insert(FriendLinks e) {
		return dao.insert("manage.friendLinks.insert", e);
	}

	@Override
	public int delete(FriendLinks e) {
		return dao.delete("manage.friendLinks.delete", e);
	}

	@Override
	public int update(FriendLinks e) {
		return dao.update("manage.friendLinks.update", e);
	}

	@Override
	public FriendLinks selectOne(FriendLinks e) {
		return (FriendLinks) dao.selectOne("manage.friendLinks.selectOne", e);
	}

	@Override
	public PageModel selectPageList(FriendLinks e) {
		return dao.selectPageList("manage.friendLinks.selectPageList", "manage.friendLinks.selectPageCount", e);
	}

	@Override
	public List<FriendLinks> selectList(FriendLinks e) {
		return dao.selectList("manage.friendLinks.selectList", e);
	}

	@Override
	public int deleteById(int id) {
		return dao.delete("manage.friendLinks.deleteById", id);
	}

	@Override
	public FriendLinks selectById(int id) {
		return (FriendLinks) dao.selectOne("manage.friendLinks.selectById", id);
	}



}
