package com.enterprise.entity.page;

import java.util.ArrayList;
import java.util.List;

/**
 * 分页模型   实体类继承该类
 */
public class PageModel implements CleanBean{
	private int id;	//id
	private int total;	//数据总数
	private List list = new ArrayList();//查询到集合
	private int pageSize = 20;	//每页数据  20
	private int offset;			//页数
	private int pagerSize;		// 总页数
	protected String pagerUrl;	//分页utl
	private int recordsTotal;	//记录总数
	private int recordsFiltered;	//记录过滤

	

	public int getTotal() {
		return total;
	}



	public void setTotal(int total) {
		this.total = total;
	}



	public List getList() {
		return list;
	}



	public void setList(List list) {
		this.list = list;
	}



	public int getOffset() {
		return offset;
	}



	public void setOffset(int offset) {
		this.offset = offset;
	}



	public int getPagerSize() {
		return pagerSize;
	}



	public void setPagerSize(int pagerSize) {
		this.pagerSize = pagerSize;
	}



	public String getPagerUrl() {
		return pagerUrl;
	}



	public void setPagerUrl(String pagerUrl) {
		this.pagerUrl = pagerUrl;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public int getRecordsTotal() {
		return recordsTotal;
	}



	public void setRecordsTotal(int recordsTotal) {
		this.recordsTotal = recordsTotal;
	}



	public int getRecordsFiltered() {
		return recordsFiltered;
	}



	public void setRecordsFiltered(int recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}





	public int getPageSize() {
		return pageSize;
	}



	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}



	@Override
	public void clean() {
		total = 0;
		list = null;
		offset = 0;
		recordsTotal = 0;
		id = 0;
	}


}
