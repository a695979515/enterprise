package com.enterprise.service.manage.messages.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.enterprise.core.dao.BaseDao;
import com.enterprise.page.PageModel;
import com.enterprise.service.manage.messages.bean.Messages;
import com.enterprise.service.manage.messages.dao.MessageDao;
@Repository("messageDaoManage")
public class MessageDaoImpl implements MessageDao{
	@Resource
	private BaseDao dao;
	

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	@Override
	public int insert(Messages e) {
		return dao.insert("message.message.insert", e);
	}

	@Override
	public int delete(Messages e) {
		return dao.delete("message.message.delete", e);
	}

	@Override
	public int update(Messages e) {
		return dao.update("manage.message.update", e);
	}

	@Override
	public Messages selectOne(Messages e) {
		return (Messages) dao.selectOne("manage.message.selectOne", e);
	}

	@Override
	public PageModel selectPageList(Messages e) {
		return dao.selectPageList("manage.message.selectPageList", "manage.message.selectPageCount", e);
	}

	@Override
	public List<Messages> selectList(Messages e) {
		return dao.selectList("manage.message.selectList", e);
	}

	@Override
	public int deleteById(int id) {
		return dao.delete("manage.message.deleteById",id);
	}

	@Override
	public Messages selectById(int id) {
		return (Messages) dao.selectOne("manage.message.selectById",id);
	}

}
