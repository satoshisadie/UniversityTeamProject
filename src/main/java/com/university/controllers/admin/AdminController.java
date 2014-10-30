package com.university.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

    @RequestMapping("/admin/home")
    public ModelAndView home() {
        final ModelAndView modelAndView = new ModelAndView("test");

        modelAndView.addObject("data", 0);

        return modelAndView;
    }

    @RequestMapping("/login")
    public ModelAndView login() {
        final ModelAndView modelAndView = new ModelAndView("test2");

        modelAndView.addObject("data", "some data");

        return modelAndView;
    }

    @RequestMapping("/dashboard")
    public ModelAndView dashboard() {
        final ModelAndView modelAndView = new ModelAndView("UserDashboard");

        return modelAndView;
    }
}
