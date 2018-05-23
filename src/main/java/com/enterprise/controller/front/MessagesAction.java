package com.enterprise.controller.front;


import com.enterprise.cache.FrontCache;
import com.enterprise.entity.Messages;
import com.enterprise.util.RequestHolder;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.enterprise.service.MessageService;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 前台留言
 *
 * @author Cesiumai
 */
@Controller("frontMessageController")
@RequestMapping("/")
public class MessagesAction {

    @Autowired
    private MessageService messageService;
    @Autowired
    private FrontCache frontCache;


    @RequestMapping("message")
    public String message() {
        return "/front/message/message";
    }

    /**
     * 前台留言
     *
     * @param e
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("message/leaveMessage")
    @ResponseBody
    public String leaveMessage(Messages e, ModelMap model) throws Exception {
        messageService.insert(e);
        frontCache.loadMessage();
        return "ok";
    }
    @RequestMapping("checkVcode")
    @ResponseBody
    public String checkVcode(@ModelAttribute("e") Messages e, HttpServletResponse response) throws IOException {
        String vcode = RequestHolder.getSession().getAttribute("validateCode").toString();
        if(StringUtils.isNotBlank(vcode)&&!(vcode.toLowerCase()).equals(e.getVcode().toLowerCase())){
            return "{\"error\":\"验证码不正确!\"}";
        }
        return null;
    }
}
