package com.university.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @RequestMapping("/dashboard/")
    public ModelAndView dashboard() {
        final ModelAndView modelAndView = new ModelAndView("/admin/dashboard");

        return modelAndView;
    }




}
