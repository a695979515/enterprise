package com.enterprise.dao;

import java.util.List;

import com.enterprise.service.Services;
import org.apache.commons.lang.StringUtils;

import com.enterprise.entity.page.PageModel;

public abstract class ServersManage <E extends PageModel, DAO extends DaoManage<E>> implements Services<E> {
    protected DAO dao;

    public DAO getDao() {
        return dao;
    }

    public abstract void setDao(DAO dao);
    /**
     * 添加
     */
    @Override
    public int insert(E e){
        if(e==null){
            throw new NullPointerException();
        }
        return dao.insert(e);
    }
    /**
     * 删除
     */
    @Override
    public int delete(E e){
        if(e == null){
            throw new NullPointerException();
        }
        return dao.delete(e);
    }
    /**
     * 批量删除
     */
    @Override
    public int deletes(String[] ids){
        if(ids == null || ids.length ==0){
            throw new NullPointerException("id不能为空");
        }
        for(int i = 0 ; i < ids.length; i++){
            if(StringUtils.isBlank(ids[i])){
                throw new NullPointerException("id不能为空");
            }
            dao.deleteById(Integer.parseInt(ids[i]));
        }
        return 0;
    }
    /**
     * 更新
     */
    @Override
    public int update(E e){
        if(e==null){
            throw new NullPointerException();
        }
        return dao.update(e);
    }
    /**
     * 查询一条记录
     */
    @Override
    public E selectOne(E e){
        return dao.selectOne(e);
    }
    /**
     * 根据id查询
     */
    @Override
    public E selectById(int id){
        return dao.selectById(id);
    }
    /**
     * 分页查询
     */
    @Override
    public PageModel selectPageList(E e){
        return dao.selectPageList(e);
    }
    /**
     * 查询集合
     */
    @Override
    public List<E> selectList(E e){
        return dao.selectList(e);
    }

}
