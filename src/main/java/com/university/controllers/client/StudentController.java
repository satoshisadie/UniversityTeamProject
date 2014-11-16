package com.university.controllers.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/student")
public class StudentController {

    @RequestMapping(value = "/course/")
    public ModelAndView course() {
        final ModelAndView modelAndView = new ModelAndView("/student/course");

        return modelAndView;
    }
}
