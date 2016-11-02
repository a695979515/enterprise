package com.enterprise.cache;

import java.io.Serializable;

public interface CacheProvider {
	/**
	 * 放入cache
	 * @param key
	 * @param cacheObject
	 */
	public void put(String key,Serializable cacheObject);
	/**
	 * 获取cache中的内容
	 * @param key
	 * @return
	 */
	public Serializable get(String key);
	/**
	 * 清除cache中对应内容
	 * @param key
	 */
	public void remove(String key);
	/**
	 * 清除所有的cache
	 */
	public void clear();

}