package com.enterprise.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import com.enterprise.entity.FriendLinks;
import org.springframework.stereotype.Repository;

import com.enterprise.dao.BaseDao;
import com.enterprise.entity.page.PageModel;
import com.enterprise.dao.FriendLinksDao;
@Repository("friendLinksDao")
public class FriendLinksDaoImpl implements FriendLinksDao{

	@Resource
	private BaseDao dao;
	
	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	@Override
	public int insert(FriendLinks e) {
		return dao.insert("friendLinks.insert", e);
	}

	@Override
	public int delete(FriendLinks e) {
		return dao.delete("friendLinks.delete", e);
	}

	@Override
	public int update(FriendLinks e) {
		return dao.update("friendLinks.update", e);
	}

	@Override
	public FriendLinks selectOne(FriendLinks e) {
		return (FriendLinks) dao.selectOne("friendLinks.selectOne", e);
	}

	@Override
	public PageModel selectPageList(FriendLinks e) {
		return dao.selectPageList("friendLinks.selectPageList", "friendLinks.selectPageCount", e);
	}

	@Override
	public List<FriendLinks> selectList(FriendLinks e) {
		return dao.selectList("friendLinks.selectList", e);
	}

	@Override
	public int deleteById(int id) {
		return dao.delete("friendLinks.deleteById", id);
	}

	@Override
	public FriendLinks selectById(int id) {
		return (FriendLinks) dao.selectOne("friendLinks.selectById", id);
	}



}
