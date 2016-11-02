package com.enterprise.service.front.messages.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.enterprise.core.dao.BaseDao;
import com.enterprise.page.PageModel;
import com.enterprise.service.front.messages.bean.Messages;
import com.enterprise.service.front.messages.dao.MessageDao;
@Repository("messageDaoFront")
public class MessageDaoImpl implements MessageDao{
	@Resource
	private BaseDao dao;
	

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	@Override
	public int insert(Messages e) {
		return dao.insert("front.message.insert", e);
	}

	@Override
	public int delete(Messages e) {
		return dao.delete("front.message.delete", e);
	}

	@Override
	public int update(Messages e) {
		return dao.update("front.message.update", e);
	}

	@Override
	public Messages selectOne(Messages e) {
		return (Messages) dao.selectOne("front.message.selectOne", e);
	}

	@Override
	public PageModel selectPageList(Messages e) {
		return dao.selectPageList("front.message.selectPageList", "front.message.selectPageCount", e);
	}

	@Override
	public List<Messages> selectList(Messages e) {
		return dao.selectList("front.message.selectList", e);
	}

	@Override
	public int deleteById(int id) {
		return dao.delete("front.message.deleteById",id);
	}

	@Override
	public Messages selectById(int id) {
		return (Messages) dao.selectOne("front.message.selectById",id);
	}

}
