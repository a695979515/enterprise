package com.enterprise.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.enterprise.cache.FrontCache;
import com.enterprise.core.SystemManage;
/**
 * 系统配置加载监听器
 * @author Administrator
 *
 */
public class SystemListener implements ServletContextListener{
    @Override
    public void contextDestroyed(ServletContextEvent arg0) {

    }

    @Override
    public void contextInitialized(ServletContextEvent arg0) {
        try{
            SystemManage.getInstance();
            WebApplicationContext app = WebApplicationContextUtils.getWebApplicationContext(arg0.getServletContext());
            FrontCache frontCache = (FrontCache) app.getBean("frontCache");
            frontCache.loadAllCache();
        }catch( Throwable e){
            e.printStackTrace();
            try {
                throw new Exception("系统初始化失败");
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }

}
