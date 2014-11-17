package com.university.controllers.common;

import com.university.controllers.client.model.Course;
import com.university.controllers.client.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {

    @RequestMapping("/login")
    public ModelAndView login() {
        final ModelAndView modelAndView = new ModelAndView("/user/login");

        return modelAndView;
    }

    @RequestMapping("/courses")
    public ModelAndView dashboard() {
        final ModelAndView modelAndView = new ModelAndView("/user/courses");

//        modelAndView.addObject("userName", "Ololosh Ololoyev");
        List<Course> courses = new ArrayList<Course>();
        Course c = new Course();
        c.setName("Information technology");
        c.setDescription("ololo ololo sjdvh dskvj sdjvn sdjbgv sdjhv s");
        c.setImg("../img/download.png");
        courses.add(c);

        c = new Course();
        c.setName("Math");
        c.setDescription("ololo adf eraosfg rgf rgflolo sjdvh dskvj sdjvn sdjbgv sdjhv s");
        c.setImg("../img/download.png");
        courses.add(c);

        c = new Course();
        c.setName("Technical english");
        c.setDescription("ololo ololo sjdvh dskvj sdjvn sdjbgv sdjhv ssdv e");
        c.setImg("../img/download.png");
        courses.add(c);

        c = new Course();
        c.setName("Speaking");
        c.setDescription("olo sdv sdvslo ololo sjdvh dskvj sdjvn sdjbgv sdjhv ssdv e");
        c.setImg("../img/download.png");
        courses.add(c);

        c = new Course();
        c.setName("Swimming");
        c.setDescription("olo dvslo ololo sjdvh dskvj sdjvn sdjbgv sdjhv ssdv e");
        c.setImg("../img/download.png");
        courses.add(c);

//        c = new Course();
//        c.setTitle("Modeling");
//        c.setDescription("o sv sv sdv sdfv sfv dfv fsdf df dfv df cx df lo dvslo ololo sjdvh dskvj sdjvn sdjbgv sdjhv ssdv e");
//        c.setImg("../img/download.png");
//        courses.add(c);

        modelAndView.addObject("courses", courses);

        return modelAndView;
    }

    @RequestMapping("/profile")
    public ModelAndView user() {
        final ModelAndView modelAndView = new ModelAndView("/user/profile");

        User user = new User();
        user.setAge(20);
        user.setGender("Male");
        user.setInfo("lalalalalalalalalalalalalala");
        user.setLocation("Cherkasy, Ukraine");
        user.setName("Anton Salenkov");
        user.setPhoto("../img/avatar.jpg");

        modelAndView.addObject("user", user);

        return modelAndView;
    }

    @RequestMapping("/profile/edit")
    public ModelAndView edit() {
        final ModelAndView modelAndView = new ModelAndView("/user/editProfile");

        User user = new User();
        user.setAge(20);
        user.setGender("Male");
        user.setInfo("lalalalalalalalalalalalalala");
        user.setLocation("Cherkasy, Ukraine");
        user.setName("Anton Salenkov");
        user.setPhoto("../img/avatar.jpg");

        modelAndView.addObject("user", user);

        return modelAndView;
    }
}
