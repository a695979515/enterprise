package com.enterprise.web.action.front.recruitment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Created by Cesiumai on 2016/6/17.
 */
@Controller("recruitmentActionController")
@RequestMapping("/")
public class RecruitmentAction {
    /**
     * 跳转到“招聘”页面
     * @return
     * @throws Exception
     */
    @RequestMapping("recruitment")
    public String recruitment() throws Exception {
        return "/front/recruitment/recruitmentList";
    }
}
