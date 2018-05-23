package com.enterprise.dao;

import java.util.List;

import com.enterprise.entity.page.PageModel;

public interface DaoManage <E extends PageModel>{
    /**
     * 添加
     * @param e
     * @return
     */
    public int insert(E e);
    /**
     * 删除
     * @param e
     * @return
     */
    public int delete(E e);
    /**
     * 更新
     * @param e
     * @return
     */
    public int update(E e);
    /**
     * 查询一条记录
     * @param e
     * @return
     */
    public E selectOne(E e);
    /**
     * 分页查询
     * @param e
     * @return
     */
    public PageModel selectPageList(E e);
    /**
     * 查询集合
     * @param e
     * @return
     */
    public List<E> selectList(E e);
    /**
     * 根据Id删除
     * @param id
     * @return
     */
    public int deleteById(int id);
    /**
     * 根据Id查询
     * @param id
     * @return
     */
    public E selectById(int id);

}

