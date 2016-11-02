package com.enterprise.web.action.front.about;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Cesiumai on 2016/7/8.
 */
@Controller("aboutActionController")
@RequestMapping("/")
public class AboutAction {

    @RequestMapping("about")
    public String contact() {
        return "/front/about/about";
    }

}
