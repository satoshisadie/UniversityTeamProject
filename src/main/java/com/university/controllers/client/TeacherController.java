package com.university.controllers.client;

import com.university.controllers.client.model.Course;
import com.university.dao.CourseDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/teacher")
public class TeacherController {
    @Autowired private CourseDao courseDao;

    @RequestMapping(value = "/dashboard/")
    public ModelAndView dashboard() {
        final ModelAndView modelAndView = new ModelAndView("/teacher/dashboard");

        List<Course> courses = courseDao.getCourses();
        modelAndView.addObject("courses", courses);

        return modelAndView;
    }

    @RequestMapping(value = "/course/{id}")
    public ModelAndView editCourse(@PathVariable int id) {
        final ModelAndView modelAndView = new ModelAndView("/teacher/editCourse");

        final List<Course> course = courseDao.getCourse(id);
        modelAndView.addObject("course", course);

        return modelAndView;
    }
}