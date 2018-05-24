package com.enterprise.controller.front;

import com.enterprise.entity.Service;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 服务领域
 * Created by Cesiumai on 2016/7/26.
 */
@Controller("serviceActionController")
@RequestMapping("/")
public class ServiceAction {
    /**
     * 跳转到“服务领域”
     * @return
     * @throws Exception
     */
    @RequestMapping("service")
    public String service() throws Exception {
        return "/front/service/serviceList";
    }
    @RequestMapping("service/{id}")
    public String selectOne(HttpServletRequest request, @ModelAttribute("id")@PathVariable("id") String id, @ModelAttribute("e") Service service) throws Exception {
        request.setAttribute("id", id);
        return "/front/service/serviceList";
    }
}
