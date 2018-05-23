package com.enterprise.service;

import java.util.List;

import com.enterprise.entity.page.PageModel;

public interface Services <E extends PageModel>{
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
     * 批量删除
     * @param ids
     * @return
     */
    public int deletes(String[] ids);
    /**
     * 更新
     * @param e
     * @return
     */
    public int update(E e);
    /**
     * 查询一条记录
     */
    public E selectOne(E e);
    /**
     * 根据Id查询
     * @param id
     * @return
     */
    public E selectById(int id);
    /**
     * 分页查询
     */
    public PageModel selectPageList(E e);
    /**
     * 查询集合
     * @param e
     * @return
     */
    public List<E> selectList(E e);

}
