package com.enterprise.web.action.front.contact;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
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
