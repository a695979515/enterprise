package com.enterprise.dao;


import com.enterprise.entity.Systemlog;

public interface SystemlogDao extends DaoManage<Systemlog>{

	Systemlog selectFirstOne(String account);

}
