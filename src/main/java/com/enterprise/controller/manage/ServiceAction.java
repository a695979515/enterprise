package com.enterprise.controller.manage;

import com.enterprise.cache.FrontCache;
import com.enterprise.service.Services;
import com.enterprise.entity.Service;
import com.enterprise.service.ServiceService;
import com.enterprise.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * 服务领域 管理
 * Created by Cesiumai on 2016/7/26.
 */
@Controller
@RequestMapping("/manage/service/")
public class ServiceAction extends BaseController<Service>{
    private static final String page_toList = "/manage/service/serviceList";
    private static final String page_toEdit = "/manage/service/serviceEdit";
    private static final String page_toAdd = "/manage/service/serviceEdit";
    @Autowired
    private ServiceService serviceService;
    @Autowired
    private FrontCache frontCache;
    @Override
    public Services<Service> getService() {
        return serviceService;
    }

    private ServiceAction() {
        super.page_toList=page_toList;
        super.page_toEdit=page_toEdit;
        super.page_toAdd=page_toAdd;
    }

    @Override
    public String insert(HttpServletRequest request, @ModelAttribute("e") Service service, RedirectAttributes flushAttrs) throws Exception {
        getService().insert(service);
        insertAfter(service);
        frontCache.loadService();
        addMessage(flushAttrs,"操作成功！");
        return "redirect:selectList";
    }

    @Override
    public String update(HttpServletRequest request, @ModelAttribute("e") Service service, RedirectAttributes flushAttrs) throws Exception {
        getService().update(service);
        insertAfter(service);
        frontCache.loadService();
        addMessage(flushAttrs, "操作成功！");
        return "redirect:selectList";
    }

    @Override
    public String deletes(HttpServletRequest request, String[] ids, @ModelAttribute("e") Service service, RedirectAttributes flushAttrs) throws Exception {
        getService().deletes(ids);
        frontCache.loadService();
        addMessage(flushAttrs,"操作成功！");
        return "redirect:selectList";
    }
}
