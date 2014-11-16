package com.university.controllers.client;

import com.university.controllers.client.model.Course;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/teacher")
public class TeacherController {

    @RequestMapping(value = "/dashboard/")
    public ModelAndView dashboard() {
        final ModelAndView modelAndView = new ModelAndView("/teacher/dashboard");

        final List<Course> courses = new ArrayList<>();

        for (int i = 0; i < 10; i++) {
            final Course course = new Course();

            course.setName("Test course " + i);
            course.setDescription("Text text text text text text text text text text text text text");

            courses.add(course);
        }

        modelAndView.addObject("courses", courses);

        return modelAndView;
    }
}