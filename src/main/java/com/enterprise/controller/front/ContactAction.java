package com.enterprise.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 联系我们
 * Created by Cesiumai on 2016/7/8.
 */
@Controller("contactActionController")
@RequestMapping("/")
public class ContactAction{

    @RequestMapping("contact")
    public String contact() {
        return "/front/contact/contact";
    }

}
