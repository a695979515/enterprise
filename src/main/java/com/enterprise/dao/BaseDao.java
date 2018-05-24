package com.enterprise.dao;

import java.util.List;

import org.apache.ibatis.exceptions.IbatisException;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.enterprise.entity.page.PageModel;

/**
 * 基础Dao
 */
@Repository
public class BaseDao extends SqlSessionDaoSupport{
	
	private static final boolean selectPrivilege = false;
	/**
	 * 打开session  mybatis中的session能进行数据库基本 的操作
	 * @return
	 */
	public SqlSession openSession(){
		try {
			SqlSession session = getSqlSession();
			return session;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 查询一条记录
	 * @param str
	 * @return
	 */
	public Object selectOne(String str){
		SqlSession session = openSession();
		return session.selectOne(str);
	}
	public Object selectOne(String str,Object obj){
		SqlSession session = openSession();
		return session.selectOne(str,obj);
	}
	
	public PageModel selectPageList(String selectList,String selectCount,Object param){
		SqlSession session = openSession();
		List list = session.selectList(selectList, param);
		PageModel pm = new PageModel();
		pm.setList(list);
		Object o = session.selectOne(selectCount,param);
		if(o!=null){
			pm.setTotal(Integer.parseInt(o.toString()));
		}else{
			pm.setTotal(0);
		}
		return pm;
	}

	/**
	 * 查询集合
	 * @param str
	 * @return
	 */
	public List selectList(String str){
		SqlSession session = openSession();
		return session.selectList(str);
	}
	public List selectList(String str,Object obj){
		SqlSession session = openSession();
		return session.selectList(str,obj);
	}
	/**
	 * 查询总数
	 * @param str
	 * @param obj
	 * @return
	 */
	public int getCount(String str , Object obj){
		SqlSession session = openSession();
		return (Integer) session.selectOne(str, obj);
	}
	/**
	 * 插入一条记录，成功则返回插入的ID；失败则抛出异常
	 * @param str
	 * @param obj
	 * @return
	 */
	public int insert(String str,Object obj){
		if(selectPrivilege){
			//如果没有权限
		}
		SqlSession session = openSession();
		int row = session.insert(str,obj);
		if(row ==1){
			return ((PageModel)obj).getId();
		}
		throw new IbatisException();
	}
	/**
	 * 更新
	 * @param str
	 * @param obj
	 * @return
	 */
	public int update(String str,Object obj){
		if(selectPrivilege){
			//如果没有权限
		}
		SqlSession session = openSession();
		int row = session.update(str, obj);
		if(row==1){
			if(obj instanceof PageModel){
				int id = ((PageModel) obj).getId();
				if(id == 0){
					return 0;
				}
				return id;
			}
		}
		return 1;
	}
	/**
	 * 删除
	 * @param str
	 * @return
	 */
	public int delete(String str){
		if(selectPrivilege){
			//如果没有权限
		}
		SqlSession session = openSession();
		return session.delete(str);
	}
	/**
	 * 删除
	 */
	public int delete(String str,Object obj){
		if(selectPrivilege){
			//如果没有权限
		}
		SqlSession session = openSession();
		return session.delete(str,obj);
	}
}
