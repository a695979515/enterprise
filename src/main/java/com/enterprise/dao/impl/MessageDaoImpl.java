package com.enterprise.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import com.enterprise.entity.Messages;
import org.springframework.stereotype.Repository;

import com.enterprise.dao.BaseDao;
import com.enterprise.entity.page.PageModel;
import com.enterprise.dao.MessageDao;
@Repository("messageDao")
public class MessageDaoImpl implements MessageDao{
	@Resource
	private BaseDao dao;
	

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	@Override
	public int insert(Messages e) {
		return dao.insert("message.insert", e);
	}

	@Override
	public int delete(Messages e) {
		return dao.delete("message.delete", e);
	}

	@Override
	public int update(Messages e) {
		return dao.update("message.update", e);
	}

	@Override
	public Messages selectOne(Messages e) {
		return (Messages) dao.selectOne("message.selectOne", e);
	}

	@Override
	public PageModel selectPageList(Messages e) {
		return dao.selectPageList("message.selectPageList", "message.selectPageCount", e);
	}

	@Override
	public List<Messages> selectList(Messages e) {
		return dao.selectList("message.selectList", e);
	}

	@Override
	public int deleteById(int id) {
		return dao.delete("message.deleteById",id);
	}

	@Override
	public Messages selectById(int id) {
		return (Messages) dao.selectOne("message.selectById",id);
	}

}
