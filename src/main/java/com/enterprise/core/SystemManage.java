package com.enterprise.core;

import com.enterprise.cache.CacheProvider;
import com.enterprise.cache.SimpleCacheProvider;
import com.enterprise.entity.About;
import com.enterprise.entity.ArticleCategory;
import com.enterprise.entity.Contact;
import com.enterprise.entity.FriendLinks;
import com.enterprise.entity.IndexImg;
import com.enterprise.entity.Messages;
import com.enterprise.entity.Recruitment;
import com.enterprise.entity.Service;
import com.enterprise.entity.SystemSetting;
import org.apache.commons.lang.StringUtils;

import javax.annotation.PostConstruct;
import java.io.Serializable;
import java.util.List;
import java.util.Properties;


/**
 * 系统管理类
 *
 * @author Cesiumai
 */
public class SystemManage {
    private static Properties p = new Properties();
    private static CacheProvider cacheProvider = new SimpleCacheProvider();
    private static SystemManage instance;

    @PostConstruct
    public void afterPropertiesSet() {
        instance = this;
    }


    public static SystemManage getInstance() {
        return instance;
    }

    public CacheProvider getCacheProvider() {
        return cacheProvider;
    }

    public void setCacheProvider(CacheProvider cacheProvider) {
        SystemManage.cacheProvider = cacheProvider;
    }

    public String getProperty(String key) {
        return p.getProperty(key);
    }

    private static String buildKey(String key) {
        return "SystemManage." + StringUtils.trimToEmpty(key);
    }

    private static void putCacheObject(String key, Serializable cacheObject) {
        String key1 = buildKey(key);
        if (cacheObject == null) {
            cacheProvider.remove(key1);
        } else {
            cacheProvider.put(key1, cacheObject);
        }
    }

    private static <T extends Serializable> T getCacheObject(String key) {
        return (T) cacheProvider.get(buildKey(key));
    }

    //系统设置
    public SystemSetting getSystemSetting() {
        return getCacheObject("systemSetting");
    }

    public void setSystemSetting(SystemSetting systemSetting) {
        putCacheObject("systemSetting", systemSetting);
    }

    //友情链接
    public List<FriendLinks> getFriendLinks() {
        return getCacheObject("friendLinks");
    }

    public void setFriendLinks(List<FriendLinks> friendLinks) {
        putCacheObject("friendLinks", (Serializable) (friendLinks));
    }

    //招聘信息
    public List<Recruitment> getRecruitments() {
        return getCacheObject("recruitments");
    }

    public void setRecruitments(List<Recruitment> recruitments) {
        putCacheObject("recruitments", (Serializable) (recruitments));
    }

    //门户图片
    public List<IndexImg> getIndexImgs() {return getCacheObject("indexImgs");}

    public void setIndexImgs(List<IndexImg> indexImgs){
        putCacheObject("indexImgs",(Serializable)(indexImgs));
    }

    //前五条留言
    public List<Messages> getMessages(){return getCacheObject("messages");}

    public void setMessages(List<Messages> messages){putCacheObject("messages",(Serializable)(messages));}

    //文章类别
    public List<ArticleCategory> getArticleCategory(){
        return getCacheObject("articleCategory");
    }
    public void setArticleCategory(List<ArticleCategory> articleCategory){
        putCacheObject("articleCategory",(Serializable)(articleCategory));
    }
    //联系我们
    public List<Contact> getContact(){
        return getCacheObject("contacts");
    }
    public void setContact(List<Contact> contacts){
        putCacheObject("contacts",(Serializable)(contacts));
    }

    //关于我们
    public List<About> getAbout(){
        return getCacheObject("abouts");
    }
    public void setAbout(List<About> abouts){
        putCacheObject("abouts",(Serializable)(abouts));
    }

    //服务领域
    public List<Service> getService(){
        return getCacheObject("services");
    }
    public void setService(List<Service> servies){
        putCacheObject("services",(Serializable)(servies));
    }



}
