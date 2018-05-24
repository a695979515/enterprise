package com.enterprise.controller.manage;

import com.enterprise.cache.FrontCache;
import com.enterprise.service.Services;
import com.enterprise.entity.About;
import com.enterprise.service.AboutService;
import com.enterprise.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * 关于我们  管理
 * Created by Cesiumai on 2016/7/8.
 */
@Controller
@RequestMapping("/manage/about")
public class AboutAction extends BaseController<About>{
    private static final String page_toEdit="/manage/about/aboutEdit";
    private static final String page_toList="/manage/about/aboutEdit";
    @Autowired
    private AboutService aboutService;
    @Autowired
    private FrontCache frontCache;
    @Override
    public Services<About> getService() {
        return aboutService;
    }

    public AboutAction() {
        super.page_toEdit=page_toEdit;
        super.page_toList=page_toList;
    }


    @Override
    public String selectList(HttpServletRequest request, About about) throws Exception {
        about = aboutService.selectOne(new About());
        request.setAttribute("e", about);
        return page_toList;
    }
    @Override
    public String update(HttpServletRequest request, @ModelAttribute("e") About e, RedirectAttributes flushAttrs) throws Exception {
        getService().update(e);
        insertAfter(e);
        addMessage(flushAttrs, "操作成功！");
        frontCache.loadAbout();
        return "redirect:selectList";
    }

    @Override
    public String insert(HttpServletRequest request, @ModelAttribute("e") About e, RedirectAttributes flushAttrs) throws Exception {
        getService().insert(e);
        insertAfter(e);
        addMessage(flushAttrs,"操作成功！");
        frontCache.loadAbout();
        return "redirect:selectList";
    }
}
