package cn.allan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {
    /**
     * 非法操作跳转到error.jsp页面
     * @return
     */
    @RequestMapping("/error")
    public String error(){
        return "error";
    }
}
