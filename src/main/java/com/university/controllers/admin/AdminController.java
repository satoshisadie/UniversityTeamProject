package com.university.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {

    @RequestMapping("/admin/home")
    @ResponseBody
    public String home() {
        return "This is admin home";
    }
}
