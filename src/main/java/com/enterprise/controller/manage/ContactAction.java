package com.enterprise.controller.manage;

import com.enterprise.cache.FrontCache;
import com.enterprise.service.Services;
import com.enterprise.entity.Contact;
import com.enterprise.service.ContactService;
import com.enterprise.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * 联系我们 管理
 * Created by Cesiumai on 2016/7/8.
 */
@Controller
@RequestMapping("/manage/contact")
public class ContactAction extends BaseController<Contact>{
    private static final String page_toEdit="/manage/contact/contactEdit";
    private static final String page_toList="/manage/contact/contactEdit";
    @Autowired
    private ContactService contactService;
    @Autowired
    private FrontCache frontCache;
    @Override
    public Services<Contact> getService() {
        return contactService;
    }

    public ContactAction() {
        super.page_toEdit=page_toEdit;
        super.page_toList=page_toList;
    }

    @Override
    public String selectList(HttpServletRequest request, Contact contact) throws Exception {
        contact = contactService.selectOne(new Contact());
        request.setAttribute("e", contact);
        return page_toList;
    }

    @Override
    public String update(HttpServletRequest request, @ModelAttribute("e") Contact e, RedirectAttributes flushAttrs) throws Exception {
        getService().update(e);
        insertAfter(e);
        addMessage(flushAttrs, "操作成功！");
        frontCache.loadContact();
        return "redirect:selectList";
    }

    @Override
    public String insert(HttpServletRequest request, @ModelAttribute("e") Contact e, RedirectAttributes flushAttrs) throws Exception {
        getService().insert(e);
        insertAfter(e);
        addMessage(flushAttrs,"操作成功！");
        frontCache.loadContact();
        return "redirect:selectList";
    }
}
